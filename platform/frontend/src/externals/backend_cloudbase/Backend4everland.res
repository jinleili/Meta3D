open FrontendUtils.BackendCloudbaseType

@module("backend-4everland")
external init: init = "init"

@module("backend-4everland")
external handleLogin: handleLogin = "handleLogin"

@module("backend-4everland")
external getAllPublishExtensionProtocols: getAllPublishExtensionProtocols =
  "getAllPublishExtensionProtocols"

@module("backend-4everland")
external getAllPublishExtensionProtocolConfigs: getAllPublishExtensionProtocolConfigs =
  "getAllPublishExtensionProtocolConfigs"

@module("backend-4everland")
external getAllPublishExtensionInfos: getAllPublishExtensionInfos = "getAllPublishExtensionInfos"

@module("backend-4everland")
external findPublishExtension: findPublishExtension = "findPublishExtension"

@module("backend-4everland")
external getAllPublishContributeProtocols: getAllPublishContributeProtocols =
  "getAllPublishContributeProtocols"

@module("backend-4everland")
external getAllPublishContributeProtocolConfigs: getAllPublishContributeProtocolConfigs =
  "getAllPublishContributeProtocolConfigs"

@module("backend-4everland")
external getAllPublishContributeInfos: getAllPublishContributeInfos = "getAllPublishContributeInfos"

@module("backend-4everland")
external findPublishContribute: findPublishContribute = "findPublishContribute"

@module("backend-4everland")
external publishApp: publishApp = "publishApp"

@module("backend-4everland")
external findPublishApp: findPublishApp = "findPublishApp"

@module("backend-4everland")
external findAllPublishAppsByAccount: findAllPublishAppsByAccount = "findAllPublishAppsByAccount"

@module("backend-4everland")
external publishElementContribute: publishElementContribute = "publishElementContribute"

@module("backend-4everland")
external publishElementAssembleData: publishElementAssembleData = "publishElementAssembleData"

@module("backend-4everland")
external publishApp: publishApp = "publishApp"

@module("backend-4everland")
external getAllPublishNewestExtensions: getAllPublishNewestExtensions =
  "getAllPublishNewestExtensions"

@module("backend-4everland")
external getElementAssembleData: getElementAssembleData = "getElementAssembleData"

@module("backend-4everland")
external publishPackage: publishPackage = "publishPackage"

@module("backend-4everland")
external getAllPublishPackageEntryExtensionProtocols: getAllPublishPackageEntryExtensionProtocols =
  "getAllPublishPackageEntryExtensionProtocols"

@module("backend-4everland")
external getAllPublishPackageInfos: getAllPublishPackageInfos = "getAllPublishPackageInfos"

@module("backend-4everland")
external findPublishPackage: findPublishPackage = "findPublishPackage"

let buildFrontendService = (): FrontendUtils.FrontendType.backendService => {
  {
    init,
    handleLogin,
    getAllPublishExtensionProtocols,
    getAllPublishExtensionProtocolConfigs,
    getAllPublishExtensionInfos,
    findPublishExtension,
    getAllPublishContributeProtocols,
    getAllPublishContributeProtocolConfigs,
    getAllPublishContributeInfos,
    findPublishContribute,
    findAllPublishAppsByAccount,
    findPublishApp,
    getAllPublishPackageEntryExtensionProtocols,
    getAllPublishPackageInfos,
    findPublishPackage,
  }
}

let buildAssembleSpaceService = (): FrontendUtils.AssembleSpaceType.backendService => {
  {
    getAllPublishExtensionProtocols: getAllPublishExtensionProtocols->Obj.magic,
    getAllPublishContributeProtocols: getAllPublishContributeProtocols->Obj.magic,
    getAllPublishContributeProtocolConfigs: getAllPublishContributeProtocolConfigs->Obj.magic,
    getAllPublishExtensionProtocolConfigs: getAllPublishExtensionProtocolConfigs->Obj.magic,
    getAllPublishNewestExtensions: getAllPublishNewestExtensions->Obj.magic,
    publishApp,
    publishPackage,
    findPublishApp,
    findAllPublishAppsByAccount,
    publishElementContribute,
    publishElementAssembleData,
    getElementAssembleData,
  }
}
