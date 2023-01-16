//
// Created by unicred on 16/01/23.
//

import UIKit

class SignUpFormView: BaseView {

    var isValid: (Bool) -> Void = { _ in
    }

    lazy var userLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Informações do Usuário"
        uiLabel.textColor = .systemGray2

        return uiLabel
    }()

    lazy var signUpUserFormView = SignUpUserFormView()

    lazy var signUpSchoolFormView = SignUpSchoolFormView()

    lazy var loginLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Informações de Login"
        uiLabel.textColor = .systemGray2

        return uiLabel
    }()

    lazy var signUpLoginFormView = SignUpLoginFormView()

    var schools: [String]? {
        didSet {
            if let schools = schools {
                signUpSchoolFormView.setSchools(schools: schools)
            }
        }
    }


    override func setup() {
        addSubviews(
                userLabel,
                signUpUserFormView,
                signUpSchoolFormView,
                loginLabel,
                signUpLoginFormView
        )

        signUpLoginFormView.inputChange = inputChange
        signUpSchoolFormView.inputChange = inputChange
        signUpUserFormView.inputChange = inputChange
    }

    override func setupConstraints() {
        signUpSchoolFormView.anchorBaseView(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor
        )

        userLabel.anchor(
                top: signUpSchoolFormView.bottomAnchor,
                padding: .init(top: 30, left: 0, bottom: 0, right: 0)
        )

        signUpUserFormView.anchorBaseView(
                top: userLabel.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )


        loginLabel.anchor(
                top: signUpUserFormView.bottomAnchor,
                padding: .init(top: 30, left: 0, bottom: 0, right: 0)
        )

        signUpLoginFormView.anchorBaseView(
                top: loginLabel.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )
    }

    func inputChange() {
        isValid(
                signUpUserFormView.isValid &&
                        signUpSchoolFormView.isValid &&
                        signUpLoginFormView.isValid
        )
    }
}
