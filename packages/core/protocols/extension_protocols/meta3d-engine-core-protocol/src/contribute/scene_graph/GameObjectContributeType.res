type gameObject = Meta3dGameobjectProtocol.Index.gameObject

type transform = Meta3dComponentTransformProtocol.Index.transform

type pbrMaterial = Meta3dComponentPbrmaterialProtocol.Index.pbrMaterial

type geometry = Meta3dComponentGeometryProtocol.Index.geometry

type directionLight = Meta3dComponentDirectionlightProtocol.Index.directionLight

type arcballCameraController = Meta3dComponentArcballcameracontrollerProtocol.Index.arcballCameraController

type basicCameraView = Meta3dComponentBasiccameraviewProtocol.Index.basicCameraView

type perspectiveCameraProjection = Meta3dComponentPerspectivecameraprojectionProtocol.Index.perspectiveCameraProjection

type transformState = ComponentType.transformState

type pbrMaterialState = ComponentType.pbrMaterialState

type geometryState = ComponentType.geometryState

type directionLightState = ComponentType.directionLightState

type arcballCameraControllerState = ComponentType.arcballCameraControllerState

type basicCameraViewState = ComponentType.basicCameraViewState

type perspectiveCameraProjectionState = ComponentType.perspectiveCameraProjectionState

type config = Meta3dGameobjectProtocol.Index.config

type createStateFunc<'state> = (. config) => 'state

type createGameObjectFunc<'state> = (. 'state) => ('state, gameObject)

type getNeedDisposedGameObjectsFunc<'state> = (. 'state) => array<gameObject>

type getTransformFunc = ComponentContributeType.getComponentFunc<transformState, transform>

type getPBRMaterialFunc = ComponentContributeType.getComponentFunc<geometryState, geometry>

type getGeometryFunc = ComponentContributeType.getComponentFunc<pbrMaterialState, pbrMaterial>

type getDirectionLightFunc = ComponentContributeType.getComponentFunc<
  directionLightState,
  directionLight,
>

type getArcballCameraControllerFunc = ComponentContributeType.getComponentFunc<
  arcballCameraControllerState,
  arcballCameraController,
>

type getBasicCameraViewFunc = ComponentContributeType.getComponentFunc<
  basicCameraViewState,
  basicCameraView,
>

type getPerspectiveCameraProjectionFunc = ComponentContributeType.getComponentFunc<
  perspectiveCameraProjectionState,
  perspectiveCameraProjection,
>

type deferDisposeTransformFunc = ComponentContributeType.deferDisposeComponentFunc<
  transformState,
  transform,
>

type deferDisposePBRMaterialFunc = ComponentContributeType.deferDisposeComponentFunc<
  pbrMaterialState,
  pbrMaterial,
>

type deferDisposeGeometryFunc = ComponentContributeType.deferDisposeComponentFunc<
  geometryState,
  geometry,
>

type deferDisposeDirectionLightFunc = ComponentContributeType.deferDisposeComponentFunc<
  directionLightState,
  directionLight,
>

type deferDisposeArcballCameraControllerFunc = ComponentContributeType.deferDisposeComponentFunc<
  arcballCameraControllerState,
  arcballCameraController,
>

type deferDisposeBasicCameraViewFunc = ComponentContributeType.deferDisposeComponentFunc<
  basicCameraViewState,
  basicCameraView,
>

type deferDisposePerspectiveCameraProjectionFunc = ComponentContributeType.deferDisposeComponentFunc<
  perspectiveCameraProjectionState,
  perspectiveCameraProjection,
>

type deferDisposeGameObjectFunc<'state> = (
  . (
    'state,
    transformState,
    pbrMaterialState,
    geometryState,
    directionLightState,
    arcballCameraControllerState,
    basicCameraViewState,
    perspectiveCameraProjectionState,
  ),
  (
    (getTransformFunc, deferDisposeTransformFunc),
    (getPBRMaterialFunc, deferDisposePBRMaterialFunc),
    (getGeometryFunc, deferDisposeGeometryFunc),
    (getDirectionLightFunc, deferDisposeDirectionLightFunc),
    (getArcballCameraControllerFunc, deferDisposeArcballCameraControllerFunc),
    (getBasicCameraViewFunc, deferDisposeBasicCameraViewFunc),
    (getPerspectiveCameraProjectionFunc, deferDisposePerspectiveCameraProjectionFunc),
  ),
  gameObject,
) => (
  'state,
  transformState,
  pbrMaterialState,
  geometryState,
  directionLightState,
  arcballCameraControllerState,
  basicCameraViewState,
  perspectiveCameraProjectionState,
)

type disposeTransformsFunc = ComponentContributeType.disposeComponentsFunc<
  transformState,
  Meta3dComponentTransformProtocol.Index.batchDisposeData,
  transform,
>

type disposePBRMaterialsFunc = ComponentContributeType.disposeComponentsFunc<
  pbrMaterialState,
  Meta3dComponentPbrmaterialProtocol.Index.batchDisposeData,
  pbrMaterial,
>

type disposeGeometrysFunc = ComponentContributeType.disposeComponentsFunc<
  geometryState,
  Meta3dComponentGeometryProtocol.Index.batchDisposeData,
  geometry,
>

type disposeDirectionLightFunc = ComponentContributeType.disposeComponentsFunc<
  directionLightState,
  Meta3dComponentDirectionlightProtocol.Index.batchDisposeData,
  directionLight,
>

type disposeArcballCameraControllerFunc = ComponentContributeType.disposeComponentsFunc<
  arcballCameraControllerState,
  Meta3dComponentArcballcameracontrollerProtocol.Index.batchDisposeData,
  arcballCameraController,
>

type disposeBasicCameraViewFunc = ComponentContributeType.disposeComponentsFunc<
  basicCameraViewState,
  Meta3dComponentBasiccameraviewProtocol.Index.batchDisposeData,
  basicCameraView,
>

type disposePerspectiveCameraProjectionFunc = ComponentContributeType.disposeComponentsFunc<
  perspectiveCameraProjectionState,
  Meta3dComponentPerspectivecameraprojectionProtocol.Index.batchDisposeData,
  perspectiveCameraProjection,
>

type actuallyDisposedGameObjects = array<gameObject>

type actuallyDisposedComponents<'component> = array<'component>

type disposeGameObjectsFunc<'state> = (
  . (
    'state,
    transformState,
    pbrMaterialState,
    geometryState,
    directionLightState,
    arcballCameraControllerState,
    basicCameraViewState,
    perspectiveCameraProjectionState,
  ),
  (
    (getTransformFunc, disposeTransformsFunc),
    (getPBRMaterialFunc, disposePBRMaterialsFunc),
    (getGeometryFunc, disposeGeometrysFunc),
    (getDirectionLightFunc, disposeDirectionLightFunc),
    (getArcballCameraControllerFunc, disposeArcballCameraControllerFunc),
    (getBasicCameraViewFunc, disposeBasicCameraViewFunc),
    (getPerspectiveCameraProjectionFunc, disposePerspectiveCameraProjectionFunc),
  ),
  array<gameObject>,
) => (
  (
    'state,
    transformState,
    pbrMaterialState,
    geometryState,
    directionLightState,
    arcballCameraControllerState,
    basicCameraViewState,
    perspectiveCameraProjectionState,
  ),
  (
    actuallyDisposedGameObjects,
    actuallyDisposedComponents<transform>,
    actuallyDisposedComponents<pbrMaterial>,
    actuallyDisposedComponents<geometry>,
    actuallyDisposedComponents<directionLight>,
    actuallyDisposedComponents<arcballCameraController>,
    actuallyDisposedComponents<basicCameraView>,
    actuallyDisposedComponents<perspectiveCameraProjection>,
  ),
)

type cloneCount = int

type clonedGameObjects = array<array<gameObject>>

type cloneTransformFunc = ComponentContributeType.cloneComponentFunc<
  transformState,
  Meta3dComponentTransformProtocol.Index.cloneConfig,
  transform,
>

type clonePBRMaterialFunc = ComponentContributeType.cloneComponentFunc<
  pbrMaterialState,
  Meta3dComponentPbrmaterialProtocol.Index.cloneConfig,
  pbrMaterial,
>

type cloneGeometryFunc = ComponentContributeType.cloneComponentFunc<
  geometryState,
  Meta3dComponentGeometryProtocol.Index.cloneConfig,
  geometry,
>

type cloneDirectionLightFunc = ComponentContributeType.cloneComponentFunc<
  directionLightState,
  Meta3dComponentDirectionlightProtocol.Index.cloneConfig,
  directionLight,
>

type cloneArcballCameraControllerFunc = ComponentContributeType.cloneComponentFunc<
  arcballCameraControllerState,
  Meta3dComponentArcballcameracontrollerProtocol.Index.cloneConfig,
  arcballCameraController,
>

type cloneBasicCameraViewFunc = ComponentContributeType.cloneComponentFunc<
  basicCameraViewState,
  Meta3dComponentBasiccameraviewProtocol.Index.cloneConfig,
  basicCameraView,
>

type clonePerspectiveCameraProjectionFunc = ComponentContributeType.cloneComponentFunc<
  perspectiveCameraProjectionState,
  Meta3dComponentPerspectivecameraprojectionProtocol.Index.cloneConfig,
  perspectiveCameraProjection,
>

type addTransformFunc = ComponentContributeType.addComponentFunc<transformState, transform>

type getTransformGameObjectsFunc = ComponentContributeType.getGameObjectsFunc<
  transformState,
  transform,
>

type getTransformDataFunc = ComponentContributeType.getComponentDataFunc<transformState, transform>

type setTransformDataFunc = ComponentContributeType.setComponentDataFunc<transformState, transform>

type addPBRMaterialFunc = ComponentContributeType.addComponentFunc<pbrMaterialState, pbrMaterial>

type addGeometryFunc = ComponentContributeType.addComponentFunc<geometryState, geometry>

type addDirectionLightFunc = ComponentContributeType.addComponentFunc<
  directionLightState,
  directionLight,
>

type addArcballCameraControllerFunc = ComponentContributeType.addComponentFunc<
  arcballCameraControllerState,
  arcballCameraController,
>

type addBasicCameraViewFunc = ComponentContributeType.addComponentFunc<
  basicCameraViewState,
  basicCameraView,
>

type addPerspectiveCameraProjectionFunc = ComponentContributeType.addComponentFunc<
  perspectiveCameraProjectionState,
  perspectiveCameraProjection,
>

type cloneGameObjectFunc<'state> = (
  . (
    'state,
    transformState,
    pbrMaterialState,
    geometryState,
    directionLightState,
    arcballCameraControllerState,
    basicCameraViewState,
    perspectiveCameraProjectionState,
  ),
  (
    (
      getTransformFunc,
      cloneTransformFunc,
      addTransformFunc,
      getTransformGameObjectsFunc,
      getTransformDataFunc,
      setTransformDataFunc,
    ),
    (getPBRMaterialFunc, clonePBRMaterialFunc, addPBRMaterialFunc),
    (getGeometryFunc, cloneGeometryFunc, addGeometryFunc),
    (getDirectionLightFunc, cloneDirectionLightFunc, addDirectionLightFunc),
    (
      getArcballCameraControllerFunc,
      cloneArcballCameraControllerFunc,
      addArcballCameraControllerFunc,
    ),
    (getBasicCameraViewFunc, cloneBasicCameraViewFunc, addBasicCameraViewFunc),
    (
      getPerspectiveCameraProjectionFunc,
      clonePerspectiveCameraProjectionFunc,
      addPerspectiveCameraProjectionFunc,
    ),
  ),
  cloneCount,
  Meta3dGameobjectProtocol.Index.cloneConfig,
  gameObject,
) => (
  (
    'state,
    transformState,
    pbrMaterialState,
    geometryState,
    directionLightState,
    arcballCameraControllerState,
    basicCameraViewState,
    perspectiveCameraProjectionState,
  ),
  clonedGameObjects,
)

type name = Meta3dGameobjectProtocol.Index.name

type getNameFunc<'state> = (. 'state, gameObject) => Js.Nullable.t<name>

type setNameFunc<'state> = (. 'state, gameObject, name) => 'state

type getAllGameObjectsFunc<'state> = (. 'state) => array<gameObject>

type restore<'state> = (. 'state, 'state) => 'state

type deepCopy<'state> = (. 'state) => 'state

// @genType
type gameObjectContribute<'state> = {
  createStateFunc: createStateFunc<'state>,
  createGameObjectFunc: createGameObjectFunc<'state>,
  getNeedDisposedGameObjectsFunc: getNeedDisposedGameObjectsFunc<'state>,
  deferDisposeGameObjectFunc: deferDisposeGameObjectFunc<'state>,
  disposeGameObjectsFunc: disposeGameObjectsFunc<'state>,
  getNameFunc: getNameFunc<'state>,
  setNameFunc: setNameFunc<'state>,
  cloneGameObjectFunc: cloneGameObjectFunc<'state>,
  getAllGameObjectsFunc: getAllGameObjectsFunc<'state>,
  restore: restore<'state>,
  deepCopy: deepCopy<'state>,
}

// type getGameObjectContribute<'state> = unit => gameObjectContribute<'state>
