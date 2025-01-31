open StateType

type gltf

type service = {
  loadGlb: (Meta3dType.Index.state, glb) => Js.Promise.t<gltf>,
  addGLBAsset: (
    Meta3dType.Index.state,
    glb,
    outsideImmutableDataId,
    glbName,
  ) => Meta3dType.Index.state,
  removeGLBAsset: (Meta3dType.Index.state, outsideImmutableDataId) => Meta3dType.Index.state,
  getAllGLBAssets: Meta3dType.Index.state => array<(outsideImmutableDataId, glbName, glb)>,
  exportAsset: Meta3dType.Index.state => assetFile,
  importAsset: (Meta3dType.Index.state, assetFile) => Meta3dType.Index.state,
}
