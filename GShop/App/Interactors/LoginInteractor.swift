//
//  LoginInteractor.swift
//  GShop
//
//  Created by Matthew on 10.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func login(login: String, password: String)
}

final class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic?
    private let network = RequestFactory().makeAuthRequestFatory()
    
    func login(login: String, password: String) {
        network.login(userName: login, password: password) { response in
            switch response.result {
            case .success(let model):
                self.presenter?.success(model: model.user)
            case .failure:
                self.presenter?.fail()
            }
        }
    }
    
}
