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

    override func loadView() {
        super.loadView()

        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
