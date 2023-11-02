import { getExtensionService as getExtensionServiceMeta3D, createExtensionState as createExtensionStateMeta3D, getExtensionLife as getLifeMeta3D, state as meta3dState, api } from "meta3d-type"
import { state } from "meta3d-engine-whole-sceneview-protocol/src/state/StateType"
import { service } from "meta3d-engine-whole-sceneview-protocol/src/service/ServiceType"
// import { service as engineCoreService } from "meta3d-engine-core-sceneview-protocol/src/service/ServiceType"
// import { state as engineCoreState } from "meta3d-engine-core-sceneview-protocol/src/state/StateType"
import { service as engineBasicService } from "meta3d-engine-basic-sceneview-protocol/src/service/ServiceType"
// import { state as engineBasicState } from "meta3d-engine-basic-sceneview-protocol/src/state/StateType"
import { service as engineSceneService } from "meta3d-engine-scene-sceneview-protocol/src/service/ServiceType"
// import { state as engineSceneState } from "meta3d-engine-scene-sceneview-protocol/src/state/StateType"
import { service as engineRenderService } from "meta3d-editor-engine-render-sceneview-protocol/src/service/ServiceType"
import { getExtensionService as getEngineWholeExtensionService } from "meta3d-engine-whole-utils/src/implement/Main"
import { service as engineCoreService } from "meta3d-engine-core-sceneview-protocol/src/service/ServiceType"
import { state as engineCoreState } from "meta3d-engine-core-sceneview-protocol/src/state/StateType"
import { pipelineContribute } from "meta3d-engine-core-sceneview-protocol/src/contribute/work/PipelineContributeType"
import { config as sceneView1Config } from "meta3d-pipeline-editor-webgl1-scene-view1-protocol/src/ConfigType";
import { state as sceneView1State, states as sceneView1States } from "meta3d-pipeline-editor-webgl1-scene-view1-protocol/src/StateType";
// import { service as eventService } from "meta3d-event-protocol/src/service/ServiceType"
import { state as eventState, states as eventStates } from "meta3d-pipeline-editor-event-protocol/src/StateType"
import { config as eventConfig } from "meta3d-pipeline-editor-event-protocol/src/ConfigType"
import { pipeline as pipelineRootPipeline, job as pipelineRootJob } from "meta3d-pipeline-root-sceneview-protocol/src/StateType"
import { pipeline as pipelineCameraPipeline, job as pipelineCameraJob } from "meta3d-pipeline-camera-sceneview-protocol/src/StateType"
import { pipeline as pipelineSceneView1Pipeline, job as pipelineSceneView1Job } from "meta3d-pipeline-editor-webgl1-scene-view1-protocol/src/StateType"
import { getExn } from "meta3d-commonlib-ts/src/NullableUtils";


let _registerEditorPipelines = (
	meta3dState: meta3dState, api: api,
	[meta3dPipelineEditorWebgl1SceneView1ContributeName, meta3dPipelineEditorEventContributeName]: [string, string],
	canvas: HTMLCanvasElement
) => {
	let engineCoreState = api.getExtensionState<engineCoreState>(meta3dState, "meta3d-engine-core-sceneview-protocol")

	let engineCoreService = api.getExtensionService<engineCoreService>(
		meta3dState,
		"meta3d-engine-core-sceneview-protocol"
	)



	let { registerPipeline } = engineCoreService

	engineCoreState = registerPipeline(engineCoreState, api.getContribute<pipelineContribute<sceneView1Config, sceneView1State>>(meta3dState, meta3dPipelineEditorWebgl1SceneView1ContributeName),
		{ canvas },
		[
			{
				pipelineName: pipelineRootPipeline.Init,
				insertElementName: pipelineRootJob.Init,
				insertAction: "after"
			},
			{
				pipelineName: pipelineCameraPipeline.Update,
				insertElementName: pipelineCameraJob.UpdateCamera,
				insertAction: "before"
			},
		]
	)
	engineCoreState = registerPipeline(engineCoreState, api.getContribute<pipelineContribute<eventConfig, eventState>>(meta3dState, meta3dPipelineEditorEventContributeName),
		null,
		[
			{
				pipelineName: pipelineSceneView1Pipeline.Init,
				insertElementName: pipelineSceneView1Job.CreateDefaultScene,
				insertAction: "before"
			},
		]
	)


	return api.setExtensionState(meta3dState, "meta3d-engine-core-sceneview-protocol", engineCoreState)
}

export let getExtensionService: getExtensionServiceMeta3D<
	service
> = (api) => {
	return {
		...getEngineWholeExtensionService(api, [
			"meta3d-bs-most-protocol",
			"meta3d-engine-core-sceneview-protocol",
			"meta3d-engine-scene-sceneview-protocol",
		]),
		prepare: (meta3dState: meta3dState, isDebug, ecsConfig, gl, canvas) => {
			gl = getExn(gl)
			// let engineBasicState = api.getExtensionState<engineBasicState>(meta3dState, meta3dEngineBasicExtensionProtocolName)

			let engineBasicService = api.getExtensionService<engineBasicService>(
				meta3dState,
				"meta3d-engine-basic-sceneview-protocol"
			)

			meta3dState = engineBasicService.prepare(meta3dState, isDebug)

			// let engineSceneState = api.getExtensionState<engineSceneState>(meta3dState, meta3dEngineSceneExtensionProtocolName)

			let engineSceneService = api.getExtensionService<engineSceneService>(
				meta3dState,
				"meta3d-engine-scene-sceneview-protocol"
			)

			meta3dState = engineSceneService.prepare(meta3dState, isDebug, ecsConfig)


			// let engineRenderState = api.getExtensionState<engineRenderState>(meta3dState, meta3dEditorEngineRenderExtensionProtocolName)

			let engineRenderService = api.getExtensionService<engineRenderService>(
				meta3dState,
				"meta3d-editor-engine-render-sceneview-protocol"
			)

			meta3dState = engineRenderService.prepare(meta3dState, isDebug, gl, canvas)



			meta3dState = _registerEditorPipelines(
				meta3dState, api,
				["meta3d-pipeline-editor-webgl1-scene-view1-protocol", "meta3d-pipeline-editor-event-protocol"],
				canvas
			)




			return meta3dState
		},
		loadScene: (meta3dState, sceneGLB) => {
			throw new Error("not implement")
		},
	}
}

export let createExtensionState: createExtensionStateMeta3D<
	state
> = () => {
	return null
}

export let getExtensionLife: getLifeMeta3D<service> = (api, extensionProtocolName) => {
	return {
	}
}
