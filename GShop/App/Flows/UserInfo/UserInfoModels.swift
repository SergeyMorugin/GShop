//
//  UserInfoModels.swift
//  GShop
//
//  Created by Matthew on 12.03.2021.
//  Copyright (c) 2021 Ostagram Inc.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum UserInfoModel {
    // MARK: Use cases
    
    enum Update {
        struct Request {
            let email: String
            let username: String
            let gender: String
            let bio: String
        }
        enum Response {
            case success(UserInfo)
            case failure(UserInfo)
        }
    }
    
    enum Show {
        struct Request {
        }
        struct Response {
            let userInfo: UserInfo
        }
    }
    
    struct ViewModel {
        var showModal: Bool = false
        var textMessage: String = ""
        
        var email: String = ""
        var username: String = ""
        var gender: String = ""
        var bio: String = ""
    }
}