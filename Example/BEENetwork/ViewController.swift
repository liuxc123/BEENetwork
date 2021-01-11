//
//  ViewController.swift
//  BEENetwork
//
//  Created by liuxc123 on 01/11/2021.
//  Copyright (c) 2021 liuxc123. All rights reserved.
//

import UIKit
import BEENetwork
import Moya
import RxSwift

class ViewController: UIViewController {

    private let dispose = DisposeBag()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        /// Using Plugins
//        let configuration = Configuration()
//        configuration.plugins.append(LoggingPlugin())
//        let manager = NetworkManager(configuration: configuration)
//
//        manager.provider
//            .rx
//            .request(MultiTarget(Api.category))
//            .asObservable().distinctUntilChanged()
//            .map(BaseModel<ListData>.self)
//            .map {$0.data.list}
//            .subscribe(onNext: { (list) in
//                print(list)
//            }, onError: { (e) in
//                print(e.localizedDescription)
//            }).disposed(by: dispose)

        //        NetworkManager.default.provider
        //            .rx
        //            .request(MultiTarget(Api.category))
        //            .asObservable().distinctUntilChanged()
        //            .map(BaseModel<ListData>.self)
        //            .map {$0.data.list}
        //            .subscribe(onNext: { (list) in
        //                self.items = list
        //                self.tableView.reloadData()
        //            }, onError: { (e) in
        //                print(e.localizedDescription)
        //            }).disposed(by: dispose)

//                Api.category.request()
//                    .map(BaseModel<ListData>.self)
//                    .map { $0.data.list }
//                    .subscribe(onSuccess: { (list) in
//                        print(list)
//                    }) { (e) in
//                        print(e.localizedDescription)
//                }.disposed(by: dispose)


        //        /// Use Cache
        //        NetworkManager.default.provider
        //            .rx
        //            .onCache(MultiTarget(Api.category))
        //            .distinctUntilChanged()
        //            .map(BaseModel<ListData>.self)
        //            .map {$0.data.list}
        //            .subscribe(onNext: { (list) in
        //                print(list)
        //            }, onError: { (e) in
        //                print(e.localizedDescription)
        //            }).disposed(by: dispose)

                Api.category.cache()
                    .distinctUntilChanged()
                    .map(BaseModel<ListData>.self)
                    .map { $0.data.list }
                    .subscribe(onNext: { (model) in
                        print(model.first?.name ?? "")
                    }, onError: { (e) in
                        print(e.localizedDescription)
                    }).disposed(by: dispose)

    }

}

struct BaseModel<T: Codable>: Codable {
    var code: Int
    var data: T
}

struct ListData: Codable {
    let list: [List]
}

struct List: Codable {
    let name: String
    let icon: String
    let columnId: String
    let rankColumn: String
    let type: String
    let require: String
}
