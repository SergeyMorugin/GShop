//
//  ProductPresenter.swift
//  GShop
//
//  Created by Matthew on 22.03.2021.
//  Copyright (c) 2021 Ostagram Inc.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductPresentationLogic {
    func present(response: ProductModel.Fetch.Response)
}

class ProductPresenter: ProductPresentationLogic {
    weak var viewController: ProductDisplayLogic?
    
    // MARK: Do something
    
    func present(response: ProductModel.Fetch.Response) {
        DispatchQueue.main.async {
            guard var viewModel = self.viewController?.viewModel else { return }
            switch response {
            case .successProductInfo(let product):
                viewModel.product = product
                self.viewController?.updateView(viewModel: viewModel)
            case .successProductReviews(let reviews):
                viewModel.reviews = reviews
                self.viewController?.updateView(viewModel: viewModel)
            case .failure:
                self.viewController?.updateView(viewModel: viewModel)
            }
        }

    }
}
