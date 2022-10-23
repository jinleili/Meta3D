import tcb from "@cloudbase/js-sdk"
import { empty, fromPromise, just, Stream } from "most";
import { getBackend, setBackend } from "../domain_layer/repo/Repo";
import * as BackendService from "meta3d-backend-cloudbase";
import { curry2, curry3_1, curry4, curry4_1 } from "meta3d-fp/src/Curry";

export let init = () => {
	let app: any = tcb.init({
		env: "meta3d-4g18u7z10c8427f9" // 此处填入您的环境ID
	})

	setBackend(app)

	return fromPromise(app.auth()
		.anonymousAuthProvider()
		.signIn())
}

export let getDatabase = () => {
	return getBackend().database()
}

// let _checkUserName = (account: string) => {
// 	return notHasData("user", { key: account })
// }

// export let handleLogin = (account: string) => {
// 	return _checkUserName(account).flatMap((isNotHasData: boolean) => {
// 		if (isNotHasData) {
// 			return fromPromise(
// 				addData("user", account, {})
// 			).concat(fromPromise(
// 				addData("publishedextensions", account, {
// 					fileData: []
// 				})
// 			)).concat(fromPromise(
// 				addData("publishedcontributes", account, {
// 					fileData: []
// 				})
// 			)).concat(fromPromise(
// 				addData("publishedelementassembledata", account, {
// 					fileData: []
// 				})
// 			)).concat(fromPromise(
// 				addData("publishedskinassembledata", account, {
// 					fileData: []
// 				})
// 			))
// 		}

// 		return just(account)
// 	})
// }

// export let notHasData = (collectionName: string, data: object) => {
// 	return fromPromise(getDatabase().collection(collectionName)
// 		.where(data)
// 		.get()
// 		.then(res => res.data.length === 0))
// }

// export let handleLogin = curry2(BackendService.handleLogin)(getBackend())

// let _blobToFile = (theBlob, fileName) => {
// 	theBlob.lastModifiedDate = new Date();
// 	theBlob.name = fileName;
// 	return theBlob;
// }

// let _arrayBufferToBlob = (arrayBuffer) => {
// 	return new Blob([arrayBuffer]);
// }

// export let uploadFile = (onUploadProgressFunc, cloudPath: string, arrayBuffer: ArrayBuffer, fileName: string): Stream<string> => {
// 	return fromPromise(getBackend().uploadFile({
// 		cloudPath,
// 		filePath: _blobToFile(_arrayBufferToBlob(arrayBuffer), fileName),
// 		onUploadProgress: function (progressEvent) {
// 			var percentCompleted = Math.round((progressEvent.loaded * 100) / progressEvent.total);

// 			onUploadProgressFunc(percentCompleted)
// 		}
// 	}).then(({ fileID }) => fileID))
// }

// export let getFile = (fileID: string) => {
// 	return fromPromise(getBackend().getTempFileURL({
// 		fileList: [fileID]
// 	})).flatMap(({ fileList }) => {
// 		return fromPromise(fetch(fileList[0].tempFileURL).then(response => response.arrayBuffer()))
// 	})
// }

// export let getData = (collectionName: string, data: any) => {
// 	return getDatabase().collection(collectionName)
// 		.where(data)
// 		.get()
// }

// export let getCollection = curry2(BackendService.getCollection)(getBackend())

// export let addData = curry4_1(BackendService.addData)(getBackend())

// export let hasAccount = curry3_1(BackendService.hasAccount)(getBackend())

// export let updateData = (collectionName: string, whereData: any, updateData: any) => {
// 	return getDatabase().collection(collectionName)
// 		.where(whereData)
// 		.update(updateData)
// }

export let handleLogin = (account) => BackendService.handleLogin(getBackend(), account)

export let addData = (addDataToBody, collectionName, key, collectionData, data) => BackendService.addData(getBackend(), addDataToBody, collectionName, key, collectionData, data)

export let hasAccount = (collectionName, account) => BackendService.hasAccount(getBackend(), collectionName, account)

export let getCollection = (collectionName) => BackendService.getCollection(getBackend(), collectionName)