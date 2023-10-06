"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.findNewestPublishPackage = void 0;
const semver_1 = require("semver");
let findNewestPublishPackage = ([findNewestPublishPackage, downloadFileFunc], entryExtensionProtocolName, packageName) => {
    return findNewestPublishPackage("publishedpackages", {
        entryExtensionProtocolName: entryExtensionProtocolName,
        packageName: packageName
    }, "entryExtensionProtocolVersion", ["packageVersion", semver_1.gt]).flatMap((data) => {
        return downloadFileFunc(data.fileID).map(file => {
            return [file, data.entryExtensionProtocolVersion, data.packageVersion, data.entryExtensionProtocolIconBase64];
        });
    });
};
exports.findNewestPublishPackage = findNewestPublishPackage;
