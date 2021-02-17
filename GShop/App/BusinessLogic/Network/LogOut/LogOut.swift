//
//  LogOut.swift
//  GShop
//
//  Created by Matthew on 17.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class LogOut: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension LogOut: LogOutRequestFactory {
    func logOut(id: String, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = LogOutRequest(id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension LogOut {
    struct LogOutRequest: RequestRouter {
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let id: String

        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}
