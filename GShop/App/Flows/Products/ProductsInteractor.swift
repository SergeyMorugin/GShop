//
//  ProductsInteractor.swift
//  GShop
//
//  Created by Matthew on 18.03.2021.
//  Copyright (c) 2021 Ostagram Inc.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductsBusinessLogic {
    func fetchProducts(request: Products.Show.Request)
}

protocol ProductsDataStore {
    
}

class ProductsInteractor: ProductsBusinessLogic, ProductsDataStore {
    var presenter: ProductsPresentationLogic?
    var worker: CatalogDataRequestFactory?
    
    // MARK: Do something
    func fetchProducts(request: Products.Show.Request) {
        worker?.catalogData(
            page: 1,
            perPage: 100,
            completionHandler: { resp in
                switch resp.result {
                case .success(let model):
                    self.presenter?.present(response: .success(model.items))
                case .failure:
                    self.presenter?.present(response: .failure)
                }
            }
        )
    }
}