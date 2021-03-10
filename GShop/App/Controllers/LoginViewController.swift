//
//  LoginViewController.swift
//  GShop
//
//  Created by Matthew on 10.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import UIKit

protocol LoginViewDisplayLogic: class {
    func displayFailedLogin()
}

final class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var interactor: LoginBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    @IBAction func onLoginClick(_ sender: Any) {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        interactor?.login(login: login, password: password)
    }
 
     /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setup() {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        interactor.presenter = presenter
        presenter.viewController = self
        
        self.interactor = interactor
    }

}

extension LoginViewController: LoginViewDisplayLogic {
    func displayFailedLogin() {
        let alert = UIAlertController(title: "Ups",
                                      message: "Wrong login or password.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
