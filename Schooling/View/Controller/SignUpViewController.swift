//
// Created by unicred on 13/01/23.
//

import UIKit

class SignUpViewController: BaseViewController {

    let signUpScreenView = SignUpScreenView()
    let signUpViewModel = SignUpViewModel()

    override func loadView() {
        super.loadView()

        view = signUpScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSchools()
    }

    func loadSchools() {
        let alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)

        present(alert, animated: true)

        signUpViewModel.getSchoolsName {
            self.signUpScreenView.schools = $0
            alert.dismiss(animated: true)
        }
    }
}
