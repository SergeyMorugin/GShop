//
//  LoginPresenter.swift
//  GShop
//
//  Created by Matthew on 10.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func success(model: User)
    func fail()
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginViewDisplayLogic?
    
    func success(model: User) {
        print("SUCCESS")
    }
    
    func fail() {
        viewController?.displayFailedLogin()
    }
}
