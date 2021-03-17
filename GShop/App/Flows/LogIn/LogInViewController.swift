//
//  LogInViewController.swift
//  GShop
//
//  Created by Matthew on 11.03.2021.
//  Copyright (c) 2021 Ostagram Inc.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LogInDisplayLogic: class {
    func displayResult(viewModel: LogIn.LoginAction.ViewModel)
}

class LogInViewController: UIViewController, LogInDisplayLogic {
    var interactor: LogInBusinessLogic?
    var router: (NSObjectProtocol & LogInRoutingLogic & LogInDataPassing)?
    // MARK: Object lifecycle
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onLoginClick(_ sender: Any) {
        doLogIn()
    }
    
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
        let interactor = LogInInteractor()
        let presenter = LogInPresenter()
        let router = LogInRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            print(router.debugDescription)
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Do something
    //@IBOutlet weak var nameTextField: UITextField!
    func doLogIn() {
        let request = LogIn.LoginAction.Request(
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? "")
        interactor?.login(request: request)
    }
    
    func displayResult(viewModel: LogIn.LoginAction.ViewModel) {
        if viewModel.showModal {
            let alert = UIAlertController(
                title: "",
                message: viewModel.textMessage,
                preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if viewModel.redirectToUserInfo {
          performSegue(withIdentifier: "UserInfo", sender: nil)
        }
    }
}
