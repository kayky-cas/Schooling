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

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.window?.tintColor.accessibilityName == ADMIN_COLOR.accessibilityName {
            appDelegate.window?.tintColor = STUDENT_COLOR
        }

        signUpScreenView.createUser = createUser

        loadOptionals()
    }

    func loadOptionals() {
        let alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)

        present(alert, animated: true)

        signUpViewModel.getSchoolsAndSubjects {
            self.signUpScreenView.schools = $0
            self.signUpScreenView.subjects = $1
            alert.dismiss(animated: true)
        }
    }

    func createUser(user: User) {
        signUpViewModel.addUser(user: user) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
