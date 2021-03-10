//
//  LoginRouter.swift
//  GShop
//
//  Created by Matthew on 10.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

protocol HomeRoutingLogic {
    func routeToSignup()
    func routeToUserInfo()
}

final class HomeRouter: HomeRoutingLogic {
    var viewController: LoginViewController?
    
    func routeToSignup() {
        
        
    }
    
    func routeToUserInfo() {
        
    }
}
