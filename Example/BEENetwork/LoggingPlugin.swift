//
//  LoggingPlugin.swift
//  BEENetwork_Example
//
//  Created by liuxc on 2021/1/11.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Moya

class LoggingPlugin: PluginType {

    func willSend(_ request: RequestType, target: TargetType) {
        //        let headers = request.request?.allHTTPHeaderFields ?? [:]
        //        let url = request.request?.url?.absoluteString ?? ""
        //        if let body = request.request?.httpBody {
        //            let bodyStr = String(bytes: body, encoding: .utf8) ?? ""
        //            Log.debug(
        //                """
        //                    url: \(url)
        //                    headers : \(headers)
        //                    body: \(bodyStr)
        //                """
        //            )
        //        } else {
        //            Log.debug(
        //                """
        //                    url: \(url)
        //                    headers : \(headers)
        //                    body: nil
        //                """
        //            )
        //        }

        debugPrint(request.request?.url?.absoluteString ?? "")
    }


    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {

        //        var respon: Response?
        //        var error: MoyaError?
        switch result {
        case let .success(response):
            do {
                let json = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
                debugPrint(json)
            } catch {
                if let string = String(bytes: response.data, encoding: .utf8) {
                    debugPrint(string)
                } else {
                    debugPrint("response empty")
                }
            }
        case let .failure(e):
            debugPrint(e)
        }

        //        let request = respon?.request
        //        let url = request?.url?.absoluteString ?? "nil"
        //        let method = request?.httpMethod ?? "nil"
        //        let statusCode = respon?.statusCode ?? 0
        //        var responseStr = "nil"
        //        if let data = respon?.data, let string = String(bytes: data, encoding: .utf8) {
        //            responseStr = string
        //        }
        //
        //        Log.debug(responseStr)

        //        Log.debug(
        //            """
        //                <didReceive - \(method) statusCode: \(statusCode)>
        //                url: \(url)
        //                error: \(error?.localizedDescription ?? "nil")
        //                response: \(responseStr)
        //            """
        //        )
    }
}
