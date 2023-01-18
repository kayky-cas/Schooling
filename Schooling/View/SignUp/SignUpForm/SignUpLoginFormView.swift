//
// Created by unicred on 16/01/23.
//

import UIKit

class SignUpLoginFormView: BaseView {

    var isValid: Bool = false

    var inputChange: () -> Void = {
    }

    var schoolDomain: String? {
        didSet {
        }
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

    lazy var confirmPasswordTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "Confirme a senha"
        baseTextField.isSecureTextEntry = true

        baseTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        return baseTextField
    }()

    override func setup() {
        addSubviews(
                emailTextField,
                passwordTextField,
                confirmPasswordTextField
        )
    }

    override func setupConstraints() {

        emailTextField.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor
        )

        passwordTextField.anchor(
                top: emailTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 2.5)
        )

        confirmPasswordTextField.anchor(
                top: emailTextField.bottomAnchor,
                leading: centerXAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 2.5, bottom: 0, right: 0)
        )
    }

    @objc func textFieldChange() {
        isValid = emailTextField.text ?? "" != "" &&
                passwordTextField.text ?? "" != "" &&
                passwordTextField.text == confirmPasswordTextField.text

        inputChange()
    }
}
