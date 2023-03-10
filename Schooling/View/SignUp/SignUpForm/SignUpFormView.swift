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

    lazy var schoolLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Informações da Escola"
        uiLabel.textColor = .systemGray2

        return uiLabel
    }()

    lazy var signUpSchoolFormView = SignUpSchoolFormView()

    lazy var loginLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Informações de Login"
        uiLabel.textColor = .systemGray2

        return uiLabel
    }()

    lazy var signUpLoginFormView = SignUpLoginFormView()

    var schools: [School]? {
        didSet {
            if let schools = schools {
                signUpSchoolFormView.setSchools(schools: schools)
            }
        }
    }

    var subjects: [Subject]? {
        didSet {
            if let subjects = subjects {
                signUpSchoolFormView.setSubjects(subjects: subjects)
            }
        }
    }

    override func setup() {
        addSubviews(
                userLabel,
                signUpUserFormView,
                schoolLabel,
                signUpSchoolFormView,
                loginLabel,
                signUpLoginFormView
        )

        signUpLoginFormView.inputChange = inputChange
        signUpSchoolFormView.inputChange = inputChange
        signUpSchoolFormView.changeSchool = {
            self.signUpLoginFormView.domain = $0.domain
        }
        signUpUserFormView.inputChange = inputChange
    }

    override func setupConstraints() {
        schoolLabel.anchor(
                top: topAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 0)
        )

        signUpSchoolFormView.anchorBaseView(
                top: schoolLabel.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
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
