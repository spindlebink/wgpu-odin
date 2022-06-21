package wgpu

import _c "core:c"

Proc :: #type proc() 

BufferMapCallback :: #type proc(
	status: BufferMapAsyncStatus,
	userdata: rawptr,
)

CompilationInfoCallback :: #type proc(
	status: CompilationInfoRequestStatus,
	compilationInfo: ^CompilationInfo,
	userdata: rawptr,
)

CreateComputePipelineAsyncCallback :: #type proc(
	status: CreatePipelineAsyncStatus,
	pipeline: ComputePipeline,
	message: cstring,
	userdata: rawptr,
)

CreateRenderPipelineAsyncCallback :: #type proc(
	status: CreatePipelineAsyncStatus,
	pipeline: RenderPipeline,
	message: cstring,
	userdata: rawptr,
)

DeviceLostCallback :: #type proc(
	reason: DeviceLostReason,
	message: cstring,
	userdata: rawptr,
)

ErrorCallback :: #type proc(
	type: ErrorType,
	message: cstring,
	userdata: rawptr,
)

QueueWorkDoneCallback :: #type proc(
	status: QueueWorkDoneStatus,
	userdata: rawptr,
)

RequestAdapterCallback :: #type proc(
	status: RequestAdapterStatus,
	adapter: Adapter,
	message: cstring,
	userdata: rawptr,
)

RequestDeviceCallback :: #type proc(
	status: RequestDeviceStatus,
	device: Device,
	message: cstring,
	userdata: rawptr,
)

