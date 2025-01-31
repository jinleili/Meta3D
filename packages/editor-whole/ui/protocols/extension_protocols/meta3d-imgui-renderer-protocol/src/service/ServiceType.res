type rect = {
  x: float,
  y: float,
  width: float,
  height: float,
}

type time = float

type color = (float, float, float)

type clearColor = (float, float, float, float)

type label = string

type size = (int, int)

type pos = (int, int)

type style = string

type texture = Meta3dWebgl1Protocol.ServiceType.texture

type context = Meta3dWebgl1Protocol.ServiceType.webgl1Context

type imageSrc = string

type imguiImplTexture

type menuLabel = string

type menuAllLabels = array<(menuLabel, array<menuLabel>)>

type selectItemMap = Meta3dCommonlibType.ImmutableHashMapType.t<menuLabel, bool>

type treeNodeLabel = string

/* !  TODO like this
// type rec treeData = array<(treeNodeLabel, imguiImplTexture, treeData)>

type treeData =
  | ScriptEventFunctionNode(nodeId, scriptEventFunctionNodeData)
  | ScriptAttributeNode(nodeId, scriptAttributeNodeData)
  | TextureNode(nodeId, textureNodeData)
  | CubemapNode(nodeId, cubemapNodeData)
  | MaterialNode(nodeId, materialNodeData)
  | WDBNode(nodeId, wdbNodeData)
  | AssetBundleNode(nodeId, assetBundleNodeData)
  | IMGUIExecFuncDataNode(nodeId, imguiExecFuncDataNodeData)
  | IMGUISkinNode(nodeId, imguiSkinNodeData)
  | IMGUICustomControlNode(nodeId, imguiCustomControlNodeData)
  | FntNode(nodeId, fntNodeData)
  | FolderNode(
      nodeId,
      folderNodeData,
      UIStateAssetType.uiState(array(treeData)),
    );
 */
type treeData

type index = int

type treeIndexData = array<index>

type treeDragData = {
  source: treeIndexData,
  target: treeIndexData,
}

type treeReturnData = (
  // bool,
  // bool,
  // bool,
  Js.Nullable.t<treeIndexData>,
  Js.Nullable.t<treeDragData>,
)

type inspectorReturnData = (
  Js.Nullable.t<string>,
  Js.Nullable.t<(float, float, float)>,
  Js.Nullable.t<(float, float, float)>,
  Js.Nullable.t<(float, float, float)>,
)

type windowFlags =
  | @as(0) None
  | @as(1) NoTitleBar

type cond =
  | @as(0) None
  | @as(1) Always

// @genType
type service = {
  init: (. StateType.state, bool, bool, Dom.htmlCanvasElement) => Js.Promise.t<StateType.state>,
  render: unit => unit,
  setStyle: (. StateType.state, style) => StateType.state,
  beforeExec: (. StateType.state, time) => StateType.state,
  afterExec: unit => unit,
  clear: (. clearColor) => unit,
  beginWindow: (. label, windowFlags) => unit,
  endWindow: unit => unit,
  beginChild: (. label) => unit,
  endChild: unit => unit,
  setNextWindowRect: (. rect) => unit,
  addFBOTexture: (. Js.Null.t<texture>, rect) => unit,
  getWindowBarHeight: unit => float,
  button: (. label, size) => bool,
  setCursorPos: (. pos) => unit,
  loadImage: (. imageSrc) => Js.Promise.t<imguiImplTexture>,
  asset: (
    . // {
    //   "loadGlbTexture": imguiImplTexture,
    //   "removeAssetTexture": imguiImplTexture,
    //   "glbTexture": imguiImplTexture,
    // },
    imguiImplTexture,
    array<(string, string)>,
    label,
    rect,
  ) => Js.Nullable.t<string>,
  handleDragDropTarget: 'data. (. string) => Js.Nullable.t<'data>,
  menu: (. menuAllLabels, string, rect) => Js.Nullable.t<menuLabel>,
  tree: (
    . treeData,
    treeNodeLabel,
    Js.Nullable.t<treeIndexData>,
    // {
    //   "addCubeTexture": imguiImplTexture,
    //   "disposeTexture": imguiImplTexture,
    //   "cloneTexture": imguiImplTexture,
    //   // "cameraIconTexture": imguiImplTexture,
    //   // "meshIconTexture": imguiImplTexture,
    //   // "lightIconTexture": imguiImplTexture,
    // },
    string,
    rect,
  ) => treeReturnData,
  inspector: (
    . string,
    (float, float, float),
    (float, float, float),
    (float, float, float),
    string,
    rect,
  ) => inspectorReturnData,
  switchButton: (
    . bool,
    {"click1Texture": imguiImplTexture, "click2Texture": imguiImplTexture},
    size,
  ) => (bool, bool),
  imageButton: (. imguiImplTexture, size) => bool,
  inputText: (. label, string, int, int) => Js.Nullable.t<string>,
  inputFloat3: (
    . label,
    (float, float, float),
    float,
    float,
    int,
  ) => Js.Nullable.t<(float, float, float)>,
  collapsing: (. label, bool, cond) => bool,
  getContext: unit => context,
}
