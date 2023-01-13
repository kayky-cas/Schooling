//
// Created by unicred on 13/01/23.
//

import UIKit

class SignUpViewController: BaseViewController {
    let signUpScreenView = SignUpScreenView()

    override func loadView() {
        super.loadView()

        view = signUpScreenView
    }
}
