import { state as meta3dState, getContribute as getContributeMeta3D } from "meta3d-type"
import { data } from "meta3d-input-window-protocol"
import { inputContribute } from "meta3d-editor-whole-protocol/src/service/ServiceType"
import { actionName as selectSceneTreeNodeActionName, state as selectSceneTreeNodeState } from "meta3d-action-select-scenetree-node-protocol"

export let getContribute: getContributeMeta3D<inputContribute<data>> = (api) => {
    return {
        inputName: "InspectorInput",
        func: (meta3dState) => {
            return Promise.resolve(!api.nullable.isNullable(
                api.nullable.bind(selectSceneTreeNodeState => selectSceneTreeNodeState.selectedGameObject, api.action.getActionState<selectSceneTreeNodeState>(meta3dState, selectSceneTreeNodeActionName))
            ))
        }
    }
}
