//
//  ProductViewController.swift
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

protocol ProductDisplayLogic: class {
    var viewModel: ProductModel.Fetch.ViewModel {get set}
    func updateView(viewModel: ProductModel.Fetch.ViewModel)
}

class ProductViewController: UITableViewController, ProductDisplayLogic {
    var interactor: ProductBusinessLogic?
    var router: (NSObjectProtocol & ProductRoutingLogic & ProductDataPassing)?
    var viewModel: ProductModel.Fetch.ViewModel = .init(product: nil, reviews: nil)
    let productCardHeight: CGFloat = 200
    let reviewCardHeight: CGFloat = 110
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ProductInteractor()
        let presenter = ProductPresenter()
        let router = ProductRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.productWorker = RequestFactory().makeGetGoodById()
        interactor.reviewWorker = RequestFactory().makeReviewsIndex()
        interactor.analyticsWorker = GoogleAnalitics()
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCard")
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewCard")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        fetchData()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func fetchData() {
        let request = ProductModel.Fetch.Request()
        interactor?.fetchProductInfo(request: request)
        interactor?.fetchProductReviews(request: request)
    }
    
    func updateView(viewModel: ProductModel.Fetch.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension ProductViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count = 1
        if let reviews = viewModel.reviews {
            count += reviews.count
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCard", for: indexPath)
            guard
                let productCell = cell as? ProductTableViewCell
            else {
                return cell
            }
            // Configure the cell...
            productCell.showProduct(product: viewModel.product)
            return productCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCard", for: indexPath)
            guard
                let reviewCell = cell as? ReviewTableViewCell
            else {
                return cell
            }
            // Configure the cell...
            if let reviews = viewModel.reviews {
              reviewCell.showReview(review: reviews[indexPath.row-1])
            }
            return reviewCell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return productCardHeight
        } else {
            return reviewCardHeight
        }
    }
    
}
