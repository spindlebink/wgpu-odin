package wgpu

import "core:c"

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
	vendorID: c.uint32_t,
	deviceID: c.uint32_t,
	name: cstring,
	driverDescription: cstring,
	adapterType: AdapterType,
	backendType: BackendType,
}

BindGroupEntry :: struct {
	nextInChain: ^ChainedStruct,
	binding: c.uint32_t,
	buffer: Buffer,
	offset: c.uint64_t,
	size: c.uint64_t,
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
	hasDynamicOffset: c.bool,
	minBindingSize: c.uint64_t,
}

BufferDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	usage: BufferUsageFlags,
	size: c.uint64_t,
	mappedAtCreation: c.bool,
}

Color :: struct {
	r: c.double,
	g: c.double,
	b: c.double,
	a: c.double,
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
	lineNum: c.uint64_t,
	linePos: c.uint64_t,
	offset: c.uint64_t,
	length: c.uint64_t,
}

ComputePassTimestampWrite :: struct {
	querySet: QuerySet,
	queryIndex: c.uint32_t,
	location: ComputePassTimestampLocation,
}

ConstantEntry :: struct {
	nextInChain: ^ChainedStruct,
	key: cstring,
	value: c.double,
}

Extent3D :: struct {
	width: c.uint32_t,
	height: c.uint32_t,
	depthOrArrayLayers: c.uint32_t,
}

InstanceDescriptor :: struct {
	nextInChain: ^ChainedStruct,
}

Limits :: struct {
	maxTextureDimension1D: c.uint32_t,
	maxTextureDimension2D: c.uint32_t,
  maxTextureDimension3D: c.uint32_t,
  maxTextureArrayLayers: c.uint32_t,
  maxBindGroups: c.uint32_t,
  maxDynamicUniformBuffersPerPipelineLayout: c.uint32_t,
  maxDynamicStorageBuffersPerPipelineLayout: c.uint32_t,
  maxSampledTexturesPerShaderStage: c.uint32_t,
  maxSamplersPerShaderStage: c.uint32_t,
  maxStorageBuffersPerShaderStage: c.uint32_t,
  maxStorageTexturesPerShaderStage: c.uint32_t,
  maxUniformBuffersPerShaderStage: c.uint32_t,
  maxUniformBufferBindingSize: c.uint32_t,
  maxStorageBufferBindingSize: c.uint32_t,
  minUniformBufferOffsetAlignment: c.uint32_t,
  minStorageBufferOffsetAlignment: c.uint32_t,
  maxVertexBuffers: c.uint32_t,
  maxVertexAttributes: c.uint32_t,
  maxVertexBufferArrayStride: c.uint32_t,
  maxInterStageShaderComponents: c.uint32_t,
  maxComputeWorkgroupStorageSize: c.uint32_t,
  maxComputeInvocationsPerWorkgroup: c.uint32_t,
  maxComputeWorkgroupSizeX: c.uint32_t,
  maxComputeWorkgroupSizeY: c.uint32_t,
  maxComputeWorkgroupSizeZ: c.uint32_t,
  maxComputeWorkgroupsPerDimension: c.uint32_t,
}

MultisampleState :: struct {
	nextInChain: ^ChainedStruct,
	count: c.uint32_t,
	mask: c.uint32_t,
	alphaToCoverageEnabled: c.bool,
}
MultisampleStateMaskMax :: c.UINT32_MAX

Origin3D :: struct {
	x: c.uint32_t,
	y: c.uint32_t,
	z: c.uint32_t,
}

PipelineLayoutDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	bindGroupLayoutCount: c.uint32_t,
	bindGroupLayouts: ^BindGroupLayout,
}

PrimitiveDepthClipControl :: struct {
	chain: ChainedStruct,
	unclippedDepth: c.bool,
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
	count: c.uint32_t,
	pipelineStatistics: ^PipelineStatisticName,
	pipelineStatisticsCount: c.uint32_t,
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
	colorFormatsCount: c.uint32_t,
	colorFormats: ^TextureFormat,
	depthStencilFormat: TextureFormat,
	sampleCount: c.uint32_t,
	depthReadOnly: c.bool,
	stencilReadOnly: c.bool,
}

RenderPassDepthStencilAttachment :: struct {
	view: TextureView,
	depthLoadOp: LoadOp,
	depthStoreOp: StoreOp,
	depthClearValue: c.float,
	depthReadOnly: c.bool,
	stencilLoadOp: LoadOp,
	stencilStoreOp: StoreOp,
	stencilClearValue: c.uint32_t,
	stencilReadOnly: c.bool,
}

RenderPassTimestampWrite :: struct {
	querySet: QuerySet,
	queryIndex: c.uint32_t,
	location: RenderPassTimestampLocation,
}

RequestAdapterOptions :: struct {
	nextInChain: ^ChainedStruct,
	compatibleSurface: Surface,
	powerPreference: PowerPreference,
	forceFallbackAdapter: c.bool,
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
	lodMinClamp: c.float,
	lodMaxClamp: c.float,
	compare: CompareFunction,
	maxAnisotropy: c.uint16_t,
}

ShaderModuleCompilationHint :: struct {
	nextInChain: ^ChainedStruct,
	entryPoint: cstring,
	layout: PipelineLayout,
}

ShaderModuleSPIRVDescriptor :: struct {
	chain: ChainedStruct,
	codeSize: c.uint32_t,
	code: ^c.uint32_t,
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
	window: c.uint32_t,
}

SurfaceDescriptorFromXlibWindow :: struct {
	chain: ChainedStruct,
	display: rawptr,
	window: c.uint32_t,
}

SwapChainDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	usage: TextureUsageFlags,
	format: TextureFormat,
	width: c.uint32_t,
	height: c.uint32_t,
	presentMode: PresentMode,
}

TextureBindingLayout :: struct {
	nextInChain: ^ChainedStruct,
	sampleType: TextureSampleType,
	viewDimension: TextureViewDimension,
	multisampled: c.bool,
}

TextureDataLayout :: struct {
	nextInChain: ^ChainedStruct,
	offset: c.uint64_t,
	bytesPerRow: c.uint32_t,
	rowsPerImage: c.uint32_t,
}

TextureViewDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	format: TextureFormat,
	dimension: TextureViewDimension,
	baseMipLevel: c.uint32_t,
	mipLevelCount: c.uint32_t,
	baseArrayLayer: c.uint32_t,
	arrayLayerCount: c.uint32_t,
	aspect: TextureAspect,
}

VertexAttribute :: struct {
	format: VertexFormat,
	offset: c.uint64_t,
	shaderLocation: c.uint32_t,
}

BindGroupDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	layout: BindGroupLayout,
	entryCount: c.uint32_t,
	entries: ^BindGroupEntry,
}

BindGroupLayoutEntry :: struct {
	nextInChain: ^ChainedStruct,
	binding: c.uint32_t,
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
	messageCount: c.uint32_t,
	messages: ^CompilationMessage,
}

ComputePassDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	timestampWriteCount: c.uint32_t,
	timestampWrites: ^ComputePassTimestampWrite,
}

DepthStencilState :: struct {
	nextInChain: ^ChainedStruct,
	format: TextureFormat,
	depthWriteEnabled: c.bool,
	depthCompare: CompareFunction,
	stencilFront: StencilFaceState,
	stencilBack: StencilFaceState,
	stencilReadMask: c.uint32_t,
	stencilWriteMask: c.uint32_t,
	depthBias: c.int32_t,
	depthBiasSlopeScale: c.float,
	depthBiasClamp: c.float,
}

ImageCopyBuffer :: struct {
	nextInChain: ^ChainedStruct,
	layout: TextureDataLayout,
	buffer: Buffer,
}

ImageCopyTexture :: struct {
	nextInChain: ^ChainedStruct,
	texture: Texture,
	mipLevel: c.uint32_t,
	origin: Origin3D,
	aspect: TextureAspect,
}

ProgrammableStageDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	module: ShaderModule,
	entryPoint: cstring,
	constantCount: c.uint32_t,
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
	hintCount: c.uint32_t,
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
	mipLevelCount: c.uint32_t,
	sampleCount: c.uint32_t,
	viewFormatCount: c.uint32_t,
	viewFormats: ^TextureFormat,
}

VertexBufferLayout :: struct {
	arrayStride: c.uint64_t,
	stepMode: VertexStepMode,
	attributeCount: c.uint32_t,
	attributes: ^VertexAttribute,
}

BindGroupLayoutDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	entryCount: c.uint32_t,
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
	requiredFeaturesCount: c.uint32_t,
	requiredFeatures: ^FeatureName,
	requiredLimits: ^RequiredLimits,
	defaultQueue: QueueDescriptor,
}

RenderPassDescriptor :: struct {
	nextInChain: ^ChainedStruct,
	label: cstring,
	colorAttachmentCount: c.uint32_t,
	colorAttachments: ^RenderPassColorAttachment,
	depthStencilAttachment: ^RenderPassDepthStencilAttachment,
	occlusionQuerySet: QuerySet,
	timestampWriteCount: c.uint32_t,
	timestampWrites: ^RenderPassTimestampWrite,
}

VertexState :: struct {
	nextInChain: ^ChainedStruct,
	module: ShaderModule,
	entryPoint: cstring,
	constantCount: c.uint32_t,
	constants: ^ConstantEntry,
	bufferCount: c.uint32_t,
	buffers: ^VertexBufferLayout,
}

FragmentState :: struct {
	nextInChain: ^ChainedStruct,
	module: ShaderModule,
	entryPoint: cstring,
	constantCount: c.uint32_t,
	constants: ^ConstantEntry,
	targetCount: c.uint32_t,
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
