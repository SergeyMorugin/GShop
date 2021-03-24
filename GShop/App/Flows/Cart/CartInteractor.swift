//
//  CartInteractor.swift
//  GShop
//
//  Created by Matthew on 24.03.2021.
//  Copyright (c) 2021 Ostagram Inc.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CartBusinessLogic {
    func doSomething(request: Cart.Something.Request)
}

protocol CartDataStore {
    //var name: String { get set }
}

class CartInteractor: CartBusinessLogic, CartDataStore {
    var presenter: CartPresentationLogic?
    var worker: CartWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Cart.Something.Request) {
        worker = CartWorker()
        worker?.doSomeWork()
        
        let response = Cart.Something.Response()
        presenter?.presentSomething(response: response)
    }
}