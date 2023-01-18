//
// Created by unicred on 13/01/23.
//

import UIKit

class LoginFormView: BaseView {

    var isValid: (Bool) -> Void = { _ in
    }

    lazy var emailTextField: BaseTextField = {
        let baseTextView = BaseTextField()

        baseTextView.placeholder = "Endereço de Email"
        baseTextView.keyboardType = .emailAddress
        baseTextView.autocapitalizationType = .none

        baseTextView.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        return baseTextView
    }()

    lazy var passwordTextField: BaseTextField = {
        let baseTextView = BaseTextField()

        baseTextView.placeholder = "Senha"
        baseTextView.isSecureTextEntry = true

        baseTextView.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        return baseTextView
    }()

    override func setup() {
        addSubviews(
                emailTextField,
                passwordTextField
        )
    }

    override func setupConstraints() {
        emailTextField.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor
        )

        passwordTextField.anchor(
                top: emailTextField.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )

    }

    @objc func textFieldChange() {
        isValid(emailTextField.text ?? "" != "" && passwordTextField.text ?? "" != "")
    }
}
