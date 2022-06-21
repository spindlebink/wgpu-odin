package main

import "core:time"
import "core:fmt"
import "core:mem"
import "core:os"
import _c "core:c"
import sdl "vendor:sdl2"
import "../wgpu"

load_wgsl :: proc(name: cstring, source: []u8) -> wgpu.ShaderModuleDescriptor {
	descriptor := new(wgpu.ShaderModuleWGSLDescriptor)
	descriptor.chain.next = nil
	descriptor.chain.sType = .ShaderModuleWGSLDescriptor
	descriptor.code = cast(cstring) raw_data(source)
	return wgpu.ShaderModuleDescriptor{
		nextInChain = cast(^wgpu.ChainedStruct)descriptor,
		label = name,
	}
}

request_adapter_callback :: proc(
	status: wgpu.RequestAdapterStatus,
	adapter: wgpu.Adapter,
	message: cstring,
	userdata: rawptr,
) {
	adapter_props: wgpu.AdapterProperties
	wgpu.AdapterGetProperties(adapter, &adapter_props)
	if status == .Success {
		user_adapter := cast(^wgpu.Adapter)userdata
		user_adapter^ = adapter
	}
}

request_device_callback :: proc(
	status: wgpu.RequestDeviceStatus,
	received: wgpu.Device,
	message: cstring,
	userdata: rawptr,
) {
	if status == .Success {
		user_device := cast(^wgpu.Device)userdata
		user_device^ = received
	}
}

log_callback :: proc(
	level: wgpu.LogLevel,
	message: cstring,
) {
	fmt.println("WGPU says:", message)
}

handle_uncaptured_error :: proc(
	type: wgpu.ErrorType,
	message: cstring,
	userdata: rawptr,
) {
	fmt.println("Error:", message)
	panic("Uncaptured WGPU error")
}

handle_device_lost :: proc(
	reason: wgpu.DeviceLostReason,
	message: cstring,
	userdata: rawptr,
) {
	fmt.println("Device lost:", message)
	panic("Device lost")
}

main :: proc() {
	tracker: mem.Tracking_Allocator
	mem.tracking_allocator_init(&tracker, context.allocator)
	defer mem.tracking_allocator_destroy(&tracker)
	context.allocator = mem.tracking_allocator(&tracker)
	defer if len(tracker.allocation_map) > 0 {
		fmt.eprintln()
		for _, v in tracker.allocation_map {
			fmt.eprintf("%v - leaked %v bytes\n", v.location, v.size)
		}
	}

	init_flags := sdl.InitFlags{.VIDEO}
	fmt.assertf(sdl.Init(init_flags) >= 0, "Could not initialize SDL")
	defer sdl.Quit()

	window := sdl.CreateWindow(
		"Test",
		i32(sdl.WINDOWPOS_UNDEFINED),
		i32(sdl.WINDOWPOS_UNDEFINED),
		1024,
		768,
		sdl.WindowFlags{.SHOWN, .RESIZABLE, .VULKAN},
	)
	defer sdl.DestroyWindow(window)
	
	wm_info: sdl.SysWMinfo
	sdl.GetVersion(&wm_info.version)
	sdl.GetWindowWMInfo(window, &wm_info)
	
	wgpu.SetLogCallback(log_callback)
	wgpu.SetLogLevel(.Warn)
	
	fmt.assertf(wm_info.subsystem == .X11, "X11 only for now")

	surface := wgpu.InstanceCreateSurface(
		nil,
		&wgpu.SurfaceDescriptor{
			label = nil,
			nextInChain = cast(^wgpu.ChainedStruct)&wgpu.SurfaceDescriptorFromXlibWindow{
				chain = wgpu.ChainedStruct{
					next = nil,
					sType = .SurfaceDescriptorFromXlibWindow,
				},
				display = wm_info.info.x11.display,
				window = cast(u32)wm_info.info.x11.window,
			},
		},
	)
	
	assert(surface != nil)
	
	adapter: wgpu.Adapter
	wgpu.InstanceRequestAdapter(
		nil,
		&wgpu.RequestAdapterOptions{
			compatibleSurface = surface,
			powerPreference = .LowPower,
			forceFallbackAdapter = false,
		},
		request_adapter_callback,
		&adapter,
	)
	
	device: wgpu.Device
	wgpu.AdapterRequestDevice(
		adapter,
		&wgpu.DeviceDescriptor{
			nextInChain = cast(^wgpu.ChainedStruct)&wgpu.DeviceExtras{
				chain = wgpu.ChainedStruct{
					next = nil,
					sType = cast(wgpu.SType)wgpu.NativeSType.DeviceExtras,
				},
			},
			requiredLimits = &wgpu.RequiredLimits{
				nextInChain = nil,
				limits = wgpu.Limits{
					maxBindGroups = 1,
				},
			},
			defaultQueue = wgpu.QueueDescriptor{
				nextInChain = nil,
				label = nil,
			},
		},
		request_device_callback,
		cast(rawptr)&device,
	)
	
	wgpu.DeviceSetUncapturedErrorCallback(device, handle_uncaptured_error, nil)
	wgpu.DeviceSetDeviceLostCallback(device, handle_device_lost, nil)
	
	shader_source := load_wgsl("shader.wgsl", #load("shader.wgsl"))
	shader := wgpu.DeviceCreateShaderModule(device, &shader_source)
	
	pipeline_layout := wgpu.DeviceCreatePipelineLayout(
		device,
		&wgpu.PipelineLayoutDescriptor{
			bindGroupLayouts = nil,
			bindGroupLayoutCount = 0,
		},
	)
	
	swap_chain_format := wgpu.SurfaceGetPreferredFormat(surface, adapter)
	
	pipeline := wgpu.DeviceCreateRenderPipeline(
		device,
		&wgpu.RenderPipelineDescriptor{
			label = "Render pipeline",
			layout = pipeline_layout,
			vertex = wgpu.VertexState{
					module = shader,
					entryPoint = "vs_main",
					bufferCount = 0,
					buffers = nil,
			},
			primitive = wgpu.PrimitiveState{
				topology = .TriangleList,
				stripIndexFormat = .Undefined,
				frontFace = .CCW,
				cullMode = .None,
			},
			multisample = wgpu.MultisampleState{
				count = 1,
				mask = _c.UINT32_MAX,
				alphaToCoverageEnabled = false,
			},
			fragment = &wgpu.FragmentState{
				module = shader,
				entryPoint = "fs_main",
				targetCount = 1,
				targets = &wgpu.ColorTargetState{
					format = swap_chain_format,
					blend = &wgpu.BlendState{
						color = wgpu.BlendComponent{
							srcFactor = .One,
							dstFactor = .Zero,
							operation = .Add,
						},
						alpha = wgpu.BlendComponent{
							srcFactor = .One,
							dstFactor = .Zero,
							operation = .Add,
						},
					},
					writeMask = wgpu.ColorWriteMaskFlagsAll,
				},
			},
			depthStencil = nil,
		},
	)
	
	window_width, window_height: i32
	sdl.GetWindowSize(window, &window_width, &window_height)
	
	swap_chain := wgpu.DeviceCreateSwapChain(
		device,
		surface,
		&wgpu.SwapChainDescriptor{
			usage = {.RenderAttachment},
			format = swap_chain_format,
			width = cast(u32) window_width,
			height = cast(u32) window_height,
			presentMode = .Fifo,
		},
	)
	
	target_frame_time := time.Millisecond * 17
	frame_start_time := time.tick_now()
	
	my_heart: for {
		frame_start_time = time.tick_now()
		
		for e: sdl.Event; sdl.PollEvent(&e) != 0; {
			#partial switch(e.type) {
				case .QUIT:
					break my_heart
				case .WINDOWEVENT:
					window_event := e.window
					if window_event.event == .SIZE_CHANGED {
						fmt.println("Size changed; recreating swap chain")
						sdl.GetWindowSize(window, &window_width, &window_height)
						swap_chain = wgpu.DeviceCreateSwapChain(
							device,
							surface,
							&wgpu.SwapChainDescriptor{
								usage = {.RenderAttachment},
								format = swap_chain_format,
								width = cast(u32) window_width,
								height = cast(u32) window_height,
								presentMode = .Fifo,
							},
						)
					}
			}
		}
		
		next_texture := wgpu.SwapChainGetCurrentTextureView(swap_chain)
		if next_texture == nil do panic("Cannot acquire next swap chain texture!")
	
		encoder := wgpu.DeviceCreateCommandEncoder(
			device,
			&wgpu.CommandEncoderDescriptor{
				label = "Command Encoder",
			},
		)

		render_pass := wgpu.CommandEncoderBeginRenderPass(
			encoder,
			&wgpu.RenderPassDescriptor{
				colorAttachments = &wgpu.RenderPassColorAttachment{
					view = next_texture,
					resolveTarget = nil,
					loadOp = .Clear,
					storeOp = .Store,
					clearValue = wgpu.Color{0.0, 1.0, 0.0, 1.0},
				},
				colorAttachmentCount = 1,
				depthStencilAttachment = nil,
			},
		)
		
		wgpu.RenderPassEncoderSetPipeline(render_pass, pipeline)
		wgpu.RenderPassEncoderDraw(render_pass, 3, 1, 0, 0)
		wgpu.RenderPassEncoderEnd(render_pass)
	
		queue := wgpu.DeviceGetQueue(device)
		cmd_buffer := wgpu.CommandEncoderFinish(
			encoder,
			&wgpu.CommandBufferDescriptor{
				label = nil,
			},
		)
		wgpu.QueueSubmit(queue, 1, &cmd_buffer)
		wgpu.SwapChainPresent(swap_chain)
	
		ms := time.duration_milliseconds(time.tick_diff(frame_start_time, time.tick_now()))
		total_frame_time := time.tick_diff(frame_start_time, time.tick_now())
		if total_frame_time < target_frame_time {
			time.sleep(target_frame_time - total_frame_time)
		} else {
			fmt.println("slow frame: ", time.tick_diff(frame_start_time, time.tick_now()))
		}
	}
}
