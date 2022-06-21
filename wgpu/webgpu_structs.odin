package wgpu

import _c "core:c"

ChainedStruct :: struct {
	next: ^ChainedStruct,
	sType: SType,
}

ChainedStructOut :: struct {
	next: ^ChainedStructOut,
	sType: SType,
}

AdapterProperties :: struct {
	nextInChain: ^ChainedStructOut,
	vendorID: _c.uint32_t,
	deviceID: _c.uint32_t,
	name: cstring,
	driverDescription: cstring,
	adapterType: AdapterType,
	backendType: BackendType,
}

BindGroupEntry :: struct {
	nextInChain: ^ChainedStruct,
	binding: _c.uint32_t,
	buffer: Buffer,
	offset: _c.uint64_t,
	size: _c.uint64_t,
	sampler: Sampler,
	textureView: TextureView,
}

BlendComponent :: struct {
	operation: BlendOperation,
	srcFactor: BlendFactor,
	dstFactor: BlendFactor,
}

BufferBindingLayout :: struct {
	nextInChain: ^ChainedStruct,
	type: BufferBindingType,
	hasDynamicOffset: _c.bool,
	minBindingSize: _c.uint64_t,
}

BufferDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	usage: BufferUsageFlags,
	size: _c.uint64_t,
	mappedAtCreation: _c.bool,
}

Color :: struct {
	r: _c.double,
	g: _c.double,
	b: _c.double,
	a: _c.double,
}

CommandBufferDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
}

CommandEncoderDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
}

CompilationMessage :: struct {
	nextInChain: ^ChainedStruct,
	message: cstring,
	type: CompilationMessageType,
	lineNum: _c.uint64_t,
	linePos: _c.uint64_t,
	offset: _c.uint64_t,
	length: _c.uint64_t,
}

ComputePassTimestampWrite :: struct {
	querySet: QuerySet,
	queryIndex: _c.uint32_t,
	location: ComputePassTimestampLocation,
}

ConstantEntry :: struct {
	nextInChain: ^ChainedStruct,
	key: cstring,
	value: _c.double,
}

Extent3D :: struct {
	width: _c.uint32_t,
	height: _c.uint32_t,
	depthOrArrayLayers: _c.uint32_t,
}

InstanceDescriptor :: struct {
	nextInChain: ^ChainedStruct,
}

Limits :: struct {
	maxTextureDimension1D: _c.uint32_t,
	maxTextureDimension2D: _c.uint32_t,
  maxTextureDimension3D: _c.uint32_t,
  maxTextureArrayLayers: _c.uint32_t,
  maxBindGroups: _c.uint32_t,
  maxDynamicUniformBuffersPerPipelineLayout: _c.uint32_t,
  maxDynamicStorageBuffersPerPipelineLayout: _c.uint32_t,
  maxSampledTexturesPerShaderStage: _c.uint32_t,
  maxSamplersPerShaderStage: _c.uint32_t,
  maxStorageBuffersPerShaderStage: _c.uint32_t,
  maxStorageTexturesPerShaderStage: _c.uint32_t,
  maxUniformBuffersPerShaderStage: _c.uint32_t,
  maxUniformBufferBindingSize: _c.uint32_t,
  maxStorageBufferBindingSize: _c.uint32_t,
  minUniformBufferOffsetAlignment: _c.uint32_t,
  minStorageBufferOffsetAlignment: _c.uint32_t,
  maxVertexBuffers: _c.uint32_t,
  maxVertexAttributes: _c.uint32_t,
  maxVertexBufferArrayStride: _c.uint32_t,
  maxInterStageShaderComponents: _c.uint32_t,
  maxComputeWorkgroupStorageSize: _c.uint32_t,
  maxComputeInvocationsPerWorkgroup: _c.uint32_t,
  maxComputeWorkgroupSizeX: _c.uint32_t,
  maxComputeWorkgroupSizeY: _c.uint32_t,
  maxComputeWorkgroupSizeZ: _c.uint32_t,
  maxComputeWorkgroupsPerDimension: _c.uint32_t,
}

MultisampleState :: struct {
	nextInChain: ^ChainedStruct,
	count: _c.uint32_t,
	mask: _c.uint32_t,
	alphaToCoverageEnabled: _c.bool,
}
MultisampleStateMaskMax :: _c.UINT32_MAX

Origin3D :: struct {
	x: _c.uint32_t,
	y: _c.uint32_t,
	z: _c.uint32_t,
}

PipelineLayoutDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	bindGroupLayoutCount: _c.uint32_t,
	bindGroupLayouts: ^BindGroupLayout,
}

PrimitiveDepthClipControl :: struct {
	chain: ChainedStruct,
	unclippedDepth: _c.bool,
}

PrimitiveState :: struct {
	nextInChain: ^ChainedStruct,
	topology: PrimitiveTopology,
	stripIndexFormat: IndexFormat,
	frontFace: FrontFace,
	cullMode: CullMode,
}

QuerySetDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	type: QueryType,
	count: _c.uint32_t,
	pipelineStatistics: ^PipelineStatisticName,
	pipelineStatisticsCount: _c.uint32_t,
}

QueueDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
}

RenderBundleDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
}

RenderBundleEncoderDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	colorFormatsCount: _c.uint32_t,
	colorFormats: ^TextureFormat,
	depthStencilFormat: TextureFormat,
	sampleCount: _c.uint32_t,
	depthReadOnly: _c.bool,
	stencilReadOnly: _c.bool,
}

RenderPassDepthStencilAttachment :: struct {
	view: TextureView,
	depthLoadOp: LoadOp,
	depthStoreOp: StoreOp,
	depthClearValue: _c.float,
	depthReadOnly: _c.bool,
	stencilLoadOp: LoadOp,
	stencilStoreOp: StoreOp,
	stencilClearValue: _c.uint32_t,
	stencilReadOnly: _c.bool,
}

RenderPassTimestampWrite :: struct {
	querySet: QuerySet,
	queryIndex: _c.uint32_t,
	location: RenderPassTimestampLocation,
}

RequestAdapterOptions :: struct {
	nextInChain: ^ChainedStruct,
	compatibleSurface: Surface,
	powerPreference: PowerPreference,
	forceFallbackAdapter: _c.bool,
}

SamplerBindingLayout :: struct {
	nextInChain: ^ChainedStruct,
	type: SamplerBindingType,
}

SamplerDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	addressModeU: AddressMode,
	addressModeV: AddressMode,
	addressModeW: AddressMode,
	magFilter: FilterMode,
	minFilter: FilterMode,
	mipmapFilter: MipmapFilterMode,
	lodMinClamp: _c.float,
	lodMaxClamp: _c.float,
	compare: CompareFunction,
	maxAnisotropy: _c.uint16_t,
}

ShaderModuleCompilationHint :: struct {
	nextInChain: ^ChainedStruct,
	entryPoint: cstring,
	layout: PipelineLayout,
}

ShaderModuleSPIRVDescriptor :: struct {
	chain: ChainedStruct,
	codeSize: _c.uint32_t,
	code: ^_c.uint32_t,
}

ShaderModuleWGSLDescriptor :: struct {
	chain: ChainedStruct,
	code: cstring,
}

StencilFaceState :: struct {
	compare: CompareFunction,
	failOp: StencilOperation,
	depthFailOp: StencilOperation,
	passOp: StencilOperation,
}

StorageTextureBindingLayout :: struct {
	nextInChain: ^ChainedStruct,
	access: StorageTextureAccess,
	format: TextureFormat,
	viewDimension: TextureViewDimension,
}

SurfaceDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
}

SurfaceDescriptorFromAndroidNativeWindow :: struct {
	chain: ChainedStruct,
	window: rawptr,
}

SurfaceDescriptorFromCanvasHTMLSelector :: struct {
	chain: ChainedStruct,
	selector: cstring,
}

SurfaceDescriptorFromMetalLayer :: struct {
	chain: ChainedStruct,
	layer: rawptr,
}

SurfaceDescriptorFromWaylandSurface :: struct {
	chain: ChainedStruct,
	display: rawptr,
	surface: rawptr,
}

SurfaceDescriptorFromWindowsHWND :: struct {
	chain: ChainedStruct,
	hinstance: rawptr,
	hwnd: rawptr,
}

SurfaceDescriptorFromXcbWindow :: struct {
	chain: ChainedStruct,
	connection: rawptr,
	window: _c.uint32_t,
}

SurfaceDescriptorFromXlibWindow :: struct {
	chain: ChainedStruct,
	display: rawptr,
	window: _c.uint32_t,
}

SwapChainDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	usage: TextureUsageFlags,
	format: TextureFormat,
	width: _c.uint32_t,
	height: _c.uint32_t,
	presentMode: PresentMode,
}

TextureBindingLayout :: struct {
	nextInChain: ^ChainedStruct,
	sampleType: TextureSampleType,
	viewDimension: TextureViewDimension,
	multisampled: _c.bool,
}

TextureDataLayout :: struct {
	nextInChain: ^ChainedStruct,
	offset: _c.uint64_t,
	bytesPerRow: _c.uint32_t,
	rowsPerImage: _c.uint32_t,
}

TextureViewDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	format: TextureFormat,
	dimension: TextureViewDimension,
	baseMipLevel: _c.uint32_t,
	mipLevelCount: _c.uint32_t,
	baseArrayLayer: _c.uint32_t,
	arrayLayerCount: _c.uint32_t,
	aspect: TextureAspect,
}

VertexAttribute :: struct {
	format: VertexFormat,
	offset: _c.uint64_t,
	shaderLocation: _c.uint32_t,
}

BindGroupDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	binding: _c.uint32_t,
	visibility: ShaderStageFlags,
	buffer: BufferBindingLayout,
	sampler: SamplerBindingLayout,
	texture: TextureBindingLayout,
	storageTexture: StorageTextureBindingLayout,
}

BindGroupLayoutEntry :: struct {
	nextInChain: ^ChainedStruct,
	binding: _c.uint32_t,
	visibility: ShaderStageFlags,
	buffer: BufferBindingLayout,
	sampler: SamplerBindingLayout,
	texture: TextureBindingLayout,
	storageTexture: StorageTextureBindingLayout,
}

BlendState :: struct {
	color: BlendComponent,
	alpha: BlendComponent,
}

CompilationInfo :: struct {
	nextInChain: ^ChainedStruct,
	messageCount: _c.uint32_t,
	messages: ^CompilationMessage,
}

ComputePassDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	timestampWriteCount: _c.uint32_t,
	timestampWrites: ^ComputePassTimestampWrite,
}

DepthStencilState :: struct {
	nextInChain: ^ChainedStruct,
	format: TextureFormat,
	depthWriteEnabled: _c.bool,
	depthCompare: CompareFunction,
	stencilFront: StencilFaceState,
	stencilBack: StencilFaceState,
	stencilReadMask: _c.uint32_t,
	stencilWriteMask: _c.uint32_t,
	depthBias: _c.int32_t,
	depthBiasSlopeScale: _c.float,
	depthBiasClamp: _c.float,
}

ImageCopyBuffer :: struct {
	nextInChain: ^ChainedStruct,
	layout: TextureDataLayout,
	buffer: Buffer,
}

ImageCopyTexture :: struct {
	nextInChain: ^ChainedStruct,
	texture: Texture,
	mipLevel: _c.uint32_t,
	origin: Origin3D,
	aspect: TextureAspect,
}

ProgrammableStageDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	module: ShaderModule,
	entryPoint: cstring,
	constantCount: _c.uint32_t,
	constants: ^ConstantEntry,
}

RenderPassColorAttachment :: struct {
	view: TextureView,
	resolveTarget: TextureView,
	loadOp: LoadOp,
	storeOp: StoreOp,
	clearValue: Color,
}

RequiredLimits :: struct {
	nextInChain: ^ChainedStruct,
	limits: Limits,
}

ShaderModuleDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	hintCount: _c.uint32_t,
	hints: ^ShaderModuleCompilationHint,
}

SupportedLimits :: struct {
	nextInChain: ^ChainedStructOut,
	limits: Limits,
}

TextureDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	usage: TextureUsageFlags,
	dimension: TextureDimension,
	size: Extent3D,
	format: TextureFormat,
	mipLevelCount: _c.uint32_t,
	sampleCount: _c.uint32_t,
	viewFormatCount: _c.uint32_t,
	viewFormats: ^TextureFormat,
}

VertexBufferLayout :: struct {
	arrayStride: _c.uint64_t,
	stepMode: VertexStepMode,
	attributeCount: _c.uint32_t,
	attributes: ^VertexAttribute,
}

BindGroupLayoutDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	entryCount: _c.uint32_t,
	entries: ^BindGroupLayoutEntry,
}

ColorTargetState :: struct {
	nextInChain: ^ChainedStruct,
	format: TextureFormat,
	blend: ^BlendState,
	writeMask: ColorWriteMaskFlags,
}

ComputePipelineDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	layout: PipelineLayout,
	compute: ProgrammableStageDescriptor,
}

DeviceDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	requiredFeaturesCount: _c.uint32_t,
	requiredFeatures: ^FeatureName,
	requiredLimits: ^RequiredLimits,
	defaultQueue: QueueDescriptor,
}

RenderPassDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	colorAttachmentCount: _c.uint32_t,
	colorAttachments: ^RenderPassColorAttachment,
	depthStencilAttachment: ^RenderPassDepthStencilAttachment,
	occlusionQuerySet: QuerySet,
	timestampWriteCount: _c.uint32_t,
	timestampWrites: ^RenderPassTimestampWrite,
}

VertexState :: struct {
	nextInChain: ^ChainedStruct,
	module: ShaderModule,
	entryPoint: cstring,
	constantCount: _c.uint32_t,
	constants: ^ConstantEntry,
	bufferCount: _c.uint32_t,
	buffers: ^VertexBufferLayout,
}

FragmentState :: struct {
	nextInChain: ^ChainedStruct,
	module: ShaderModule,
	entryPoint: cstring,
	constantCount: _c.uint32_t,
	constants: ^ConstantEntry,
	targetCount: _c.uint32_t,
	targets: ^ColorTargetState,
}

RenderPipelineDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	layout: PipelineLayout,
	vertex: VertexState,
	primitive: PrimitiveState,
	depthStencil: ^DepthStencilState,
	multisample: MultisampleState,
	fragment: ^FragmentState,
}
