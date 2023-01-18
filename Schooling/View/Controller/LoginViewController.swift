//
//  ViewController.swift
//  Schooling
//
//  Created by unicred on 13/01/23.
//
//

import UIKit

class LoginViewController: BaseViewController {

    let loginScreenView = LoginScreenView()
    let loginViewModel = LoginViewModel()
    let authProvider = AuthProvider.shared

    override func loadView() {
        super.loadView()

        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreenView.signUpTouchUpInsideAction = navigateToSignUp
        loginScreenView.loginTouchUpInsideAction = login
    }

    func login() {
        let (email, password) = loginScreenView.getLogin()

        let alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)

        present(alert, animated: true)

        loginViewModel.login(email: email, password: password) { user in
            if let user = user {
                self.authProvider.setUser(user: user)
            }

            alert.dismiss(animated: true)

            self.verifyLoggedUser()
        }
    }

    func verifyLoggedUser() {
        if authProvider.isLogged() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = BaseTapViewController()
        }
    }

    func navigateToSignUp() {
        let signUpViewController = SignUpViewController()

        navigationController?.pushViewController(signUpViewController, animated: true)
    }
}
