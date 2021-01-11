//
//  Api.swift
//  BEENetwork_Example
//
//  Created by liuxc on 2021/1/11.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import BEENetwork

enum Api {
    case category
}

extension Api: SugarTargetType {

    var baseURL: URL {
        return URL(string: "https://app.sports.qq.com")!
    }

    var route: Route {
        return .get("/match/columnsV45?appvid=5.9.7&deviceId=F63F3976B00144C0B9F4F5963A2B2AFE&frontVersion=22c30dd2960cd32aaf76a3994918329a&guid=F63F3976B00144C0B9F4F5963A2B2AFE&hardware=iPhone8,1&height=1334&idfa=F129DC0D-6982-4A01-B2D2-5E63B4753BD0&idfv=F63F3976-B001-44C0-B9F4-F5963A2B2AFE&network=wifi&omgbizid=6200b2139c75c143700acb6c4ebbdc14474a0130113805&omgid=39bc6ea6065f8c4bb1cb76d6699de073d9e70010111318&os=iphone&osvid=11.4.1&width=750")
    }

    var parameters: Parameters? {
        return nil
    }

    var sampleData: Data {
        return "".data(using: .utf8)!
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return [:]
    }
}

