package wgpu

when ODIN_OS == .Linux || ODIN_OS == .Darwin {
	foreign import wgpu_native "system:wgpu_native"
}
else when ODIN_OS == .Windows {
	foreign import wgpu_native "wgpu_native.lib"
}

import _c "core:c"

NativeSType :: enum _c.int {
	DeviceExtras = 0x60000001,
	AdapterExtras = 0x60000002,
	RequiredLimitsExtras = 0x60000003,
	PipelineLayoutExtras = 0x60000004,
	ShaderModuleGLSLDescriptor = 0x60000005,
}

NativeFeature :: enum _c.int {
	PUSH_CONSTANTS = 0x04000000,
	TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES = 0x10000000,
}

LogLevel :: enum _c.int {
	Off,
	Error,
	Warn,
	Info,
	Debug,
	Trace,
}

AdapterExtras :: struct {
	chain: ChainedStruct,
	backend: BackendType,
}

DeviceExtras :: struct {
	chain: ChainedStruct,
	nativeFeatures: NativeFeature,
	label: cstring,
	tracePath: cstring,
}

RequiredLimitsExtras :: struct {
	chain: ChainedStruct,
	maxPushConstantSize: _c.uint32_t,
}

PushConstantRange :: struct {
	stages: ShaderStageFlags,
	start: _c.uint32_t,
	end: _c.uint32_t,
}

PipelineLayoutExtras :: struct {
	chain: ChainedStruct,
	pushConstantRangeCount: _c.uint32_t,
	pushConstantRanges: ^PushConstantRange,
}

LogCallback :: #type proc(
	level: LogLevel,
	message: cstring,
)

@(link_prefix="wgpu")
foreign wgpu_native {
	DevicePoll :: proc(
		device: Device,
		force_wait: bool,
	) ---
	
	SetLogCallback :: proc(
		callback: LogCallback,
	) ---
	
	SetLogLevel :: proc(
		level: LogLevel,
	) ---
	
	GetVersion :: proc() -> _c.uint32_t ---
	
	RenderPassEncoderSetPushConstants :: proc(
		encoder: RenderPassEncoder,
		stages: ShaderStageFlags,
		offset: _c.uint32_t,
		sizeBytes: _c.uint32_t,
		data: rawptr,
	) ---

	BufferDrop :: proc(
		buffer: Buffer,
	) ---

	CommandEncoderDrop :: proc(
		commandEncoder: CommandEncoder,
	) ---

	DeviceDrop :: proc(
		device: Device,
	) ---

	QuerySetDrop :: proc(
		querySet: QuerySet,
	) ---

	RenderPipelineDrop :: proc(
		renderPipeline: RenderPipeline,
	) ---

	TextureDrop :: proc(
		texture: Texture,
	) ---

	TextureViewDrop :: proc(
		textureView: Texture,
	) ---

	SamplerDrop :: proc(
		sampler: Sampler,
	) ---

	BindGroupLayoutDrop :: proc(
		bindGroupLayout: BindGroupLayout,
	) ---
	
	PipelineLayoutDrop :: proc(
		pipelineLayout: PipelineLayout,
	) ---
	
	BindGroupDrop :: proc(
		bindGroup: BindGroup,
	) ---
	
	ShaderModuleDrop :: proc(
		shaderModule: ShaderModule,
	) ---
	
	CommandBufferDrop :: proc(
		commandBuffer: CommandBuffer,
	) ---
	
	RenderBundleDrop :: proc(
		renderBundle: RenderBundle,
	) ---
	
	ComputePipelineDrop :: proc(
		computePipeline: ComputePipeline,
	) ---
}
