package wgpu

when ODIN_OS == .Linux || ODIN_OS == .Darwin {
	foreign import wgpu_native "system:wgpu_native"
}

import _c "core:c"

ARRAY_LAYER_COUNT_UNDEFINED: _c.ulong : 0xffffffff
COPY_STRIDE_UNDEFINED: _c.ulong : 0xffffffff
LIMIT_U32_UNDEFINED: _c.ulong : 0xffffffff
LIMIT_U64_UNDEFINED: _c.ulonglong : 0xffffffffffffffff
MIP_LEVEL_COUNT_UNDEFINED: _c.ulong : 0xffffffff
WHOLE_MAP_SIZE :: _c.SIZE_MAX
WHOLE_SIZE: _c.ulonglong : 0xffffffffffffffff

Adapter :: rawptr
BindGroup :: rawptr
BindGroupLayout :: rawptr
Buffer :: rawptr
CommandBuffer :: rawptr
CommandEncoder :: rawptr
ComputePassEncoder :: rawptr
ComputePipeline :: rawptr
Device :: rawptr
Instance :: rawptr
PipelineLayout :: rawptr
QuerySet :: rawptr
Queue :: rawptr
RenderBundle :: rawptr
RenderBundleEncoder :: rawptr
RenderPassEncoder :: rawptr
RenderPipeline :: rawptr
Sampler :: rawptr
ShaderModule :: rawptr
Surface :: rawptr
SwapChain :: rawptr
Texture :: rawptr
TextureView :: rawptr

@(link_prefix="wgpu")
foreign wgpu_native {
	CreateInstance :: proc(
		descriptor: ^InstanceDescriptor,
	) -> Instance ---
	
	GetProcAddress :: proc(
		device: Device,
		procName: cstring,
	) -> Proc ---

	AdapterEnumerateFeatures :: proc(
		adapter: Adapter,
		features: ^FeatureName,
	) -> _c.size_t ---
	
	AdapterGetLimits :: proc(
		adapter: Adapter,
		limits: ^SupportedLimits,
	) -> _c.bool ---

	AdapterGetProperties :: proc(
		adapter: Adapter,
		properties: ^AdapterProperties,
	) ---

	AdapterHasFeature :: proc(
		adapter: Adapter,
		feature: FeatureName,
	) -> _c.bool ---

	AdapterRequestDevice :: proc(
		adapter: Adapter,
		descriptor: ^DeviceDescriptor,
		callback: RequestDeviceCallback,
		userdata: rawptr,
	) ---
	
	BufferDestroy :: proc(
		buffer: Buffer,
	) ---
	
	BufferGetConstMappedRange :: proc(
		buffer: Buffer,
		offset: _c.size_t,
		size: _c.size_t,
	) -> rawptr ---
	
	BufferGetMappedRange :: proc(
		buffer: Buffer,
		offset: _c.size_t,
		size: _c.size_t,
	) -> rawptr ---
	
	BufferMapAsync :: proc(
		buffer: Buffer,
		mode: MapModeFlags,
		offset: _c.size_t,
		size: _c.size_t,
		callback: BufferMapCallback,
		userdata: rawptr,
	) ---
	
	BufferUnmap :: proc(
		buffer: Buffer,
	) ---
	
	CommandEncoderBeginComputePass :: proc(
		commandEncoder: CommandEncoder,
		descriptor: ComputePassDescriptor,
	) -> ComputePassEncoder ---

	CommandEncoderBeginRenderPass :: proc(
		commandEncoder: CommandEncoder,
		descriptor: ^RenderPassDescriptor,
	) -> RenderPassEncoder ---

	CommandEncoderClearBuffer :: proc(
		commandEncoder: CommandEncoder,
		buffer: Buffer,
		offset: _c.uint64_t,
		size: _c.uint64_t,
	) ---

	CommandEncoderCopyBufferToBuffer :: proc(
		commandEncoder: CommandEncoder,
		source: Buffer,
		sourceOffset: _c.uint64_t,
		destination: Buffer,
		destinationOffset: _c.uint64_t,
		size: _c.uint64_t,
	) ---
	
	CommandEncoderCopyBufferToTexture :: proc(
		commandEncoder: CommandEncoder,
		source: ^ImageCopyBuffer,
		destination: ^ImageCopyTexture,
		copySize: ^Extent3D,
	) ---

	CommandEncoderCopyTextureToBuffer :: proc(
		commandEncoder: CommandEncoder,
		source: ^ImageCopyTexture,
		destination: ^ImageCopyBuffer,
		copySize: ^Extent3D,
	) ---
	
	CommandEncoderCopyTextureToTexture :: proc(
		commandEncoder: CommandEncoder,
		source: ^ImageCopyTexture,
		destination: ^ImageCopyTexture,
		copySize: ^Extent3D,
	) ---
	
	CommandEncoderFinish :: proc(
		commandEncoder: CommandEncoder,
		descriptor: ^CommandBufferDescriptor,
	) -> CommandBuffer ---
	
	CommandEncoderInsertDebugMarker :: proc(
		commandEncoder: CommandEncoder,
		markerLabel: cstring,
	) ---
	
	CommandEncoderPopDebugGroup :: proc(
		commandEncoder: CommandEncoder,
	) ---
	
	CommandEncoderPushDebugGroup :: proc(
		commandEncoder: CommandEncoder,
		groupLabel: cstring,
	) ---
	
	CommandEncoderResolveQuerySet :: proc(
		commandEncoder: CommandEncoder,
		querySet: QuerySet,
		firstQuery: _c.uint32_t,
		queryCount: _c.uint32_t,
		destination: Buffer,
		destinationOffset: _c.uint64_t,
	) ---
	
	CommandEncoderWriteTimestamp :: proc(
		commandEncoder: CommandEncoder,
		querySet: QuerySet,
		queryIndex: _c.uint32_t,
	) ---

	DeviceCreateBindGroup :: proc(
		device: Device,
		descriptor: ^BindGroupDescriptor,
	) -> BindGroup ---

	DeviceCreateBindGroupLayout :: proc(
		device: Device,
		descriptor: ^BindGroupDescriptor,
	) -> BindGroupLayout ---
	
	DeviceCreateBuffer :: proc(
		device: Device,
		descriptor: ^BufferDescriptor,
	) -> Buffer ---
	
	DeviceCreateCommandEncoder :: proc(
		device: Device,
		descriptor: ^CommandEncoderDescriptor,
	) -> CommandEncoder ---
	
	DeviceCreateComputePipeline :: proc(
		device: Device,
		descriptor: ^ComputePipelineDescriptor,
	) -> ComputePipeline ---
	
	DeviceCreateComputePipelineAsync :: proc(
		device: Device,
		descriptor: ^ComputePipelineDescriptor,
		callback: CreateComputePipelineAsyncCallback,
		userdata: rawptr,
	) ---
	
	DeviceCreatePipelineLayout :: proc(
		device: Device,
		descriptor: ^PipelineLayoutDescriptor,
	) -> PipelineLayout ---
	
	DeviceCreateQuerySet :: proc(
		device: Device,
		descriptor: ^QuerySetDescriptor,
	) -> QuerySet ---
	
	DeviceCreateRenderBundleEncoder :: proc(
		device: Device,
		descriptor: ^RenderBundleEncoderDescriptor,
	) -> RenderBundleEncoder ---

	DeviceCreateRenderPipeline :: proc(
		device: Device,
		descriptor: ^RenderPipelineDescriptor,
	) -> RenderPipeline ---
	
	DeviceCreateRenderPipelineAsync :: proc(
		device: Device,
		descriptor: ^RenderPipelineDescriptor,
		callback: CreateRenderPipelineAsyncCallback,
		userdata: rawptr,
	) ---
	
	DeviceCreateSampler :: proc(
		device: Device,
		descriptor: ^SamplerDescriptor,
	) -> Sampler ---
	
	DeviceCreateShaderModule :: proc(
		device: Device,
		descriptor: ^ShaderModuleDescriptor,
	) -> ShaderModule ---
	
	DeviceCreateSwapChain :: proc(
		device: Device,
		surface: Surface,
		descriptor: ^SwapChainDescriptor,
	) -> SwapChain ---
	
	DeviceCreateTexture :: proc(
		device: Device,
		descriptor: ^TextureDescriptor,
	) -> Texture ---
	
	DeviceDestroy :: proc(
		device: Device,
	) ---

	DeviceEnumerateFeatures :: proc(
		device: Device,
		features: ^FeatureName,
	) -> _c.size_t ---
	
	DeviceGetLimits :: proc(
		device: Device,
		limits: ^SupportedLimits,
	) -> _c.bool ---
	
	DeviceGetQueue :: proc(
		device: Device,
	) -> Queue ---
	
	DeviceHasFeature :: proc(
		device: Device,
		feature: FeatureName,
	) -> _c.bool ---

	DevicePopErrorScope :: proc(
		device: Device,
		callback: ErrorCallback,
		userdata: rawptr,
	) -> _c.bool ---
	
	DevicePushErrorScope :: proc(
		device: Device,
		filter: ErrorFilter,
	) ---
	
	DeviceSetDeviceLostCallback :: proc(
		device: Device,
		callback: DeviceLostCallback,
		userdata: rawptr,
	) ---
	
	DeviceSetUncapturedErrorCallback :: proc(
		device: Device,
		callback: ErrorCallback,
		userdata: rawptr,
	) ---

	InstanceCreateSurface :: proc(
		instance: Instance,
		descriptor: ^SurfaceDescriptor,
	) -> Surface ---
	
	InstanceProcessEvents :: proc(
		instance: Instance,
	) ---
	
	InstanceRequestAdapter :: proc(
		instance: Instance,
		options: ^RequestAdapterOptions,
		callback: RequestAdapterCallback,
		userdata: rawptr,
	) ---
	
	QuerySetDestroy :: proc(
		querySet: QuerySet,
	) ---
	
	QueueOnSubmittedWorkDone :: proc(
		queue: Queue,
		callback: QueueWorkDoneCallback,
		userdata: rawptr,
	) ---
	
	QueueSubmit :: proc(
		queue: Queue,
		commandCount: _c.uint32_t,
		commands: ^CommandBuffer,
	) ---
	
	QueueWriteBuffer :: proc(
		queue: Queue,
		buffer: Buffer,
		bufferOffset: _c.uint64_t,
		data: rawptr,
		size: _c.size_t,
	) ---
	
	QueueWriteTexture :: proc(
		queue: Queue,
		destination: ^ImageCopyTexture,
		data: rawptr,
		dataSize: _c.size_t,
		dataLayout: ^TextureDataLayout,
		writeSize: ^Extent3D,
	) ---
	
	RenderBundleEncoderDraw :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		vertexCount: _c.uint32_t,
		instanceCount: _c.uint32_t,
		firstVertex: _c.uint32_t,
		firstInstance: _c.uint32_t,
	) ---
	
	RenderBundleEncoderDrawIndexed :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		indexCount: _c.uint32_t,
		instanceCount: _c.uint32_t,
		firstIndex: _c.uint32_t,
		baseVertex: _c.int32_t,
		firstInstance: _c.uint32_t,
	) ---
	
	RenderBundleEncoderDrawIndexedIndirect :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		indirectBuffer: Buffer,
		indirectOffset: _c.uint64_t,
	) ---
	
	RenderBundleEncoderDrawIndirect :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		indirectBuffer: Buffer,
		indirectOffset: _c.uint64_t,
	) ---
	
	RenderBundleEncoderFinish :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		descriptor: ^RenderBundleDescriptor,
	) -> RenderBundle ---
	
	RenderBundleEncoderInsertDebugMarker :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		markerLabel: cstring,
	) ---
	
	RenderBundleEncoderPopDebugGroup :: proc(
		renderBundleEncoder: RenderBundleEncoder,
	) ---
	
	RenderBundleEncoderPushDebugGroup :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		groupLabel: cstring,
	) ---
	
	RenderBundleEncoderSetBindGroup :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		groupIndex: _c.uint32_t,
		group: BindGroup,
		dynamicOffsetCount: _c.uint32_t,
		dynamicOffsets: ^_c.uint32_t,
	) ---
	
	RenderBundleEncoderSetIndexBuffer :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		buffer: Buffer,
		format: IndexFormat,
		offset: _c.uint64_t,
		size: _c.uint64_t,
	) ---
	
	RenderBundleEncoderSetPipeline :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		pipeline: RenderPipeline,
	) ---
	
	RenderBundleEncoderSetVertexBuffer :: proc(
		renderBundleEncoder: RenderBundleEncoder,
		slot: _c.uint32_t,
		buffer: Buffer,
		offset: _c.uint64_t,
		size: _c.uint64_t,
	) ---
	
	RenderPassEncoderBeginOcclusionQuery :: proc(
		renderPassEncoder: RenderPassEncoder,
		queryIndex: _c.uint32_t,
	) ---
	
	RenderPassEncoderBeginPipelineStatisticsQuery :: proc(
		renderPassEncoder: RenderPassEncoder,
		querySet: QuerySet,
		queryIndex: _c.uint32_t,
	) ---
	
	RenderPassEncoderDraw :: proc(
		renderPassEncoder: RenderPassEncoder,
		vertexCount: _c.uint32_t,
		instanceCount: _c.uint32_t,
		firstVertex: _c.uint32_t,
		firstInstance: _c.uint32_t,
	) ---
	
	RenderPassEncoderDrawIndexed :: proc(
		renderPassEncoder: RenderPassEncoder,
		indexCount: _c.uint32_t,
		instanceCount: _c.uint32_t,
		firstIndex: _c.uint32_t,
		baseVertex: _c.int32_t,
		firstInstance: _c.uint32_t,
	) ---
	
	RenderPassEncoderDrawIndexedIndirect :: proc(
		renderPassEncoder: RenderPassEncoder,
		indirectBuffer: Buffer,
		indirectOffset: _c.uint64_t,
	) ---
	
	RenderPassEncoderDrawIndirect :: proc(
		renderPassEncoder: RenderPassEncoder,
		indirectBuffer: Buffer,
		indirectOffset: _c.uint64_t,
	) ---
	
	RenderPassEncoderEnd :: proc(
		renderPassEncoder: RenderPassEncoder,
	) ---
	
	RenderPassEncoderEndOcclusionQuery :: proc(
		renderPassEncoder: RenderPassEncoder,
	) ---
	
	RenderPassEncoderEndPipelineStatisticsQuery :: proc(
		renderPassEncoder: RenderPassEncoder,
	) ---
	
	RenderPassEncoderExecuteBundles :: proc(
		renderPassEncoder: RenderPassEncoder,
		bundlesCount: _c.uint32_t,
		bundles: ^RenderBundle,
	) ---
	
	RenderPassEncoderInsertDebugMarker :: proc(
		renderPassEncoder: RenderPassEncoder,
		markerLabel: cstring,
	) ---
	
	RenderPassEncoderPopDebugGroup :: proc(
		renderPassEncoder: RenderPassEncoder,
	) ---
	
	RenderPassEncoderPushDebugGroup :: proc(
		renderPassEncoder: RenderPassEncoder,
		groupLabel: cstring,
	) ---
	
	RenderPassEncoderSetBindGroup :: proc(
		renderPassEncoder: RenderPassEncoder,
		groupIndex: _c.uint32_t,
		group: BindGroup,
		dynamicOffsetCount: _c.uint32_t,
		dynamicOffsets: ^_c.uint32_t,
	) ---
	
	RenderPassEncoderSetBlendConstant :: proc(
		renderPassEncoder: RenderPassEncoder,
		color: ^Color,
	) ---
	
	RenderPassEncoderSetIndexBuffer :: proc(
		renderPassEncoder: RenderPassEncoder,
		buffer: Buffer,
		format: IndexFormat,
		offset: _c.uint64_t,
		size: _c.uint64_t,
	) ---
	
	RenderPassEncoderSetPipeline :: proc(
		renderPassEncoder: RenderPassEncoder,
		pipeline: RenderPipeline,
	) ---
	
	RenderPassEncoderSetScissorRect :: proc(
		renderPassEncoder: RenderPassEncoder,
		x: _c.uint32_t,
		y: _c.uint32_t,
		width: _c.uint32_t,
		height: _c.uint32_t,
	) ---
	
	RenderPassEncoderSetStencilReference :: proc(
		renderPassEncoder: RenderPassEncoder,
		reference: _c.uint32_t,
	) ---
	
	RenderPassEncoderSetVertexBuffer :: proc(
		renderPassEncoder: RenderPassEncoder,
		slot: _c.uint32_t,
		buffer: Buffer,
		offset: _c.uint64_t,
		size: _c.uint64_t,
	) ---
	
	RenderPassEncoderSetViewport :: proc(
		renderPassEncoder: RenderPassEncoder,
		x: _c.float,
		y: _c.float,
		width: _c.float,
		height: _c.float,
		minDepth: _c.float,
		maxDepth: _c.float,
	) ---
	
	SurfaceGetPreferredFormat :: proc(
		surface: Surface,
		adapter: Adapter,
	) -> TextureFormat ---

	SwapChainGetCurrentTextureView :: proc(
		swapChain: SwapChain,
	) -> TextureView ---
	
	SwapChainPresent :: proc(
		swapChain: SwapChain,
	) ---
	
	TextureCreateView :: proc(
		texture: Texture,
		descriptor: ^TextureViewDescriptor,
	) -> TextureView ---
	
	TextureDestroy :: proc(
		texture: Texture,
	) ---
}
