package wgpu

import _c "core:c"

AdapterType :: enum _c.int {
	DiscreteGPU,
	IntegratedGPU,
	CPU,
	Unknown,
}

AddressMode :: enum _c.int {
	Repeat,
	MirrorRepeat,
	ClampToEdge,
}

BackendType :: enum _c.int {
	Null,
	WebGPU,
	D3D11,
	D3D12,
	Metal,
	Vulkan,
	OpenGL,
	OpenGLES,
}

BlendFactor :: enum _c.int {
	Zero,
	One,
	Src,
	OneMinusSrc,
	SrcAlpha,
	OneMinusSrcAlpha,
	Dst,
	OneMinusDst,
	DstAlpha,
	OneMinusDstAlpha,
	SrcAlphaSaturated,
	Constant,
	OneMinusConstant,
}

BlendOperation :: enum _c.int {
	Add,
	Subtract,
	ReverseSubtract,
	Min,
	Max,
}

BufferBindingType :: enum _c.int {
	Undefined,
	Uniform,
	Storage,
	ReadOnlyStorage,
}

BufferMapAsyncStatus :: enum _c.int {
	Success,
	Error,
	Unknown,
	DeviceLost,
	DestroyedBeforeCallback,
	UnmappedBeforeCallback,
}

CompareFunction :: enum _c.int {
	Undefined,
	Never,
	Less,
	LessEqual,
	Greater,
	GreaterEqual,
	Equal,
	NotEqual,
	Always,
}

CompilationInfoRequestStatus :: enum _c.int {
	Success,
	Error,
	DeviceLost,
	Unknown,
}

CompilationMessageType :: enum _c.int {
	Error,
	Warning,
	Info,
}

ComputePassTimestampLocation :: enum _c.int {
	Beginning,
	End,
}

CreatePipelineAsyncStatus :: enum _c.int {
	Success,
	Error,
	DeviceLost,
	DeviceDestroyed,
	Unknown,
}

CullMode :: enum _c.int {
	None,
	Front,
	Back,
}

DeviceLostReason :: enum _c.int {
	Undefined,
	Destroyed,
}

ErrorFilter :: enum _c.int {
	NoError,
	Validation,
	OutOfMemory,
	Unknown,
	DeviceLost,
}

ErrorType :: enum _c.int {
	NoError,
	Validation,
	OutOfMemory,
	Unknown,
	DeviceLost,
}

FeatureName :: enum _c.int {
	Undefined,
	DepthClipControl,
	Depth24UnormStencil8,
	Depth32FloatStencil8,
	TimestampQuery,
	PipelineStatisticsQuery,
	TextureCompressionBC,
	TextureCompressionETC2,
	TextureCompressionASTC,
	IndirectFirstInstance,
}

FilterMode :: enum _c.int {
	Nearest,
	Linear,
}

FrontFace :: enum _c.int {
	CCW,
	CW,
}

IndexFormat :: enum _c.int {
	Undefined,
	Uint16,
	Uint32,
}

LoadOp :: enum _c.int {
	Undefined,
	Clear,
	Load,
}

MipmapFilterMode :: enum _c.int {
	Nearest,
	Linear,
}

PipelineStatisticName :: enum _c.int {
	VertexShaderInvocations,
	ClipperInvocations,
	ClipperPrimitivesOut,
	FragmentShaderInvocations,
	ComputeShaderInvocations,
}

PowerPreference :: enum _c.int {
	Undefined,
	LowPower,
	HighPerformance,
}

PredefinedColorSpace :: enum _c.int {
	Undefined,
	Srgb,
}

PresentMode :: enum _c.int {
	Immediate,
	Mailbox,
	Fifo,
}

PrimitiveTopology :: enum _c.int {
	PointList,
	LineList,
	LineStrip,
	TriangleList,
	TriangleStrip,
}

QueryType :: enum _c.int {
	Occlusion,
	PipelineStatistics,
	Timestamp,
}

QueueWorkDoneStatus :: enum _c.int {
	Success,
	Error,
	Unknown,
	DeviceLost,
}

RenderPassTimestampLocation :: enum _c.int {
	Beginning,
	End,
}

RequestAdapterStatus :: enum _c.int {
	Success,
	Unavailable,
	Error,
	Unknown,
}

RequestDeviceStatus :: enum _c.int {
	Success,
	Error,
	Unknown,
}

SType :: enum _c.int {
	Invalid,
	SurfaceDescriptorFromMetalLayer,
	SurfaceDescriptorFromWindowsHWND,
	SurfaceDescriptorFromXlibWindow,
	SurfaceDescriptorFromCanvasHTMLSelector,
	ShaderModuleSPIRVDescriptor,
	ShaderModuleWGSLDescriptor,
	PrimitiveDepthClipControl,
	SurfaceDescriptorFromWaylandSurface,
	SurfaceDescriptorFromAndroidNativeWindow,
	SurfaceDescriptorFromXcbWindow,
}

SamplerBindingType :: enum _c.int {
	Undefined,
	Filtering,
	NonFiltering,
	Comparison,
}

StencilOperation :: enum _c.int {
	Keep,
	Zero,
	Replace,
	Invert,
	IncrementClamp,
	DecrementClamp,
	IncrementWrap,
	DecrementWrap,
}

StorageTextureAccess :: enum _c.int {
	Undefined,
	WriteOnly,
}

StoreOp :: enum _c.int {
	Undefined,
	Store,
	Discard,
}

TextureAspect :: enum _c.int {
	All,
	StencilOnly,
	DepthOnly,
}

ComponentType :: enum _c.int {
	Float,
	Sint,
	Uint,
	DepthComparison,
}

TextureDimension :: enum _c.int {
	D1,
	D2,
	D3,
}

TextureFormat :: enum _c.int {
	Undefined,
	R8Unorm,
	R8Snorm,
	R8Uint,
	R8Sint,
	R16Uint,
	R16Sint,
	R16Float,
	RG8Unorm,
	RG8Snorm,
	RG8Uint,
	RG8Sint,
	R32Float,
	R32Uint,
	R32Sint,
	RG16Uint,
	RG16Sint,
	RG16Float,
	RGBA8Unorm,
	RGBA8UnormSrgb,
	RGBA8Snorm,
	RGBA8Uint,
	RGBA8Sint,
	BGRA8Unorm,
	BGRA8UnormSrgb,
	RGB10A2Unorm,
	RG11B10Ufloat,
	RGB9E5Ufloat,
	RG32Float,
	RG32Uint,
	RG32Sint,
	RGBA16Uint,
	RGBA16Sint,
	RGBA16Float,
	RGBA32Float,
	RGBA32Uint,
	RGBA32Sint,
	Stencil8,
	Depth16Unorm,
	Depth24Plus,
	Depth24PlusStencil8,
	Depth24UnormStencil8,
	Depth32Float,
	Depth32FloatStencil8,
	BC1RGBAUnorm,
	BC1RGBAUnormSrgb,
	BC2RGBAUnorm,
	BC2RGBAUnormSrgb,
	BC3RGBAUnorm,
	BC3RGBAUnormSrgb,
	BC4RUnorm,
	BC4RSnorm,
	BC5RGUnorm,
	BC5RGSnorm,
	BC6HRGBUfloat,
	BC6HRGBFloat,
	BC7RGBAUnorm,
	BC7RGBAUnormSrgb,
	ETC2RGB8Unorm,
	ETC2RGB8UnormSrgb,
	ETC2RGB8A1Unorm,
	ETC2RGB8A1UnormSrgb,
	ETC2RGBA8Unorm,
	ETC2RGBA8UnormSrgb,
	EACR11Unorm,
	EACR11Snorm,
	EACRG11Unorm,
	EACRG11Snorm,
	ASTC4x4Unorm,
	ASTC4x4UnormSrgb,
	ASTC5x4Unorm,
	ASTC5x4UnormSrgb,
	ASTC5x5Unorm,
	ASTC5x5UnormSrgb,
	ASTC6x5Unorm,
	ASTC6x5UnormSrgb,
	ASTC6x6Unorm,
	ASTC6x6UnormSrgb,
	ASTC8x5Unorm,
	ASTC8x5UnormSrgb,
	ASTC8x6Unorm,
	ASTC8x6UnormSrgb,
	ASTC8x8Unorm,
	ASTC8x8UnormSrgb,
	ASTC10x5Unorm,
	ASTC10x5UnormSrgb,
	ASTC10x6Unorm,
	ASTC10x6UnormSrgb,
	ASTC10x8Unorm,
	ASTC10x8UnormSrgb,
	ASTC10x10Unorm,
	ASTC10x10UnormSrgb,
	ASTC12x10Unorm,
  ASTC12x10UnormSrgb,
  ASTC12x12Unorm,
  ASTC12x12UnormSrgb,
}

TextureSampleType :: enum _c.int {
	Undefined,
	Float,
	UnfilterableFloat,
	Depth,
	Sint,
	Uint,
}

TextureViewDimension :: enum _c.int {
	Undefined,
	D1,
	D2,
	D2Array,
	Cube,
	CubeArray,
	D3,
}

VertexFormat :: enum _c.int {
	Undefined,
	Uint8x2,
	Uint8x4,
	Sint8x2,
	Sint8x4,
	Unorm8x2,
	Unorm8x4,
	Snorm8x2,
	Snorm8x4,
	Uint16x2,
	Uint16x4,
	Sint16x2,
	Sint16x4,
	Unorm16x2,
	Unorm16x4,
	Snorm16x2,
	Snorm16x4,
	Float16x2,
	Float16x4,
	Float32,
	Float32x2,
	Float32x3,
	Float32x4,
	Uint32,
	Uint32x2,
	Uint32x3,
	Uint32x4,
	Sint32,
	Sint32x2,
	Sint32x3,
	Sint32x4,
}

VertexStepMode :: enum _c.int {
	Vertex,
	Instance,
}

BufferUsage :: enum _c.int {
	MapRead,
	MapWrite,
	CopySrc,
	CopyDst,
	Index,
	Vertex,
	Uniform,
	Storage,
	Indirect,
	QueryResolve,
}
BufferUsageFlags :: bit_set[BufferUsage; _c.uint32_t]
BufferUsageFlagsNone :: BufferUsageFlags{}

ColorWriteMask :: enum _c.int {
	Red,
	Green,
	Blue,
	Alpha,
	All,
}
ColorWriteMaskFlags :: bit_set[ColorWriteMask; _c.uint32_t]
ColorWriteMaskFlagsNone :: ColorWriteMaskFlags{}
ColorWriteMaskFlagsAll :: ColorWriteMaskFlags{.Red, .Green, .Blue, .Alpha}

MapMode :: enum _c.int {
	Red,
	Green,
	Blue,
	Alpha,
}
MapModeFlags :: bit_set[MapMode; _c.uint32_t]
MapModeFlagsNone :: MapModeFlags{}
MapModeFlagsAll :: MapModeFlags{.Red, .Green, .Blue, .Alpha}

ShaderStage :: enum _c.int {
	Vertex,
	Fragment,
	Compute,
}
ShaderStageFlags :: bit_set[ShaderStage; _c.uint32_t]
ShaderStageFlagsNone :: ShaderStageFlags{}

TextureUsage :: enum _c.int {
	CopySrc,
	CopyDst,
	TextureBinding,
	StorageBinding,
	RenderAttachment,
}
TextureUsageFlags :: bit_set[TextureUsage; _c.uint32_t]
TextureUsageFlagsNone :: TextureUsage{}
