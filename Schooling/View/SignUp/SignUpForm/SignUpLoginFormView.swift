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

    var domain: String? {
        didSet {
            userNameAddDomain()
        }
    }

    lazy var usernameTextField: BaseTextField = {
        let baseTextView = BaseTextField()

        baseTextView.placeholder = "Nome de Usuário"
        baseTextView.keyboardType = .emailAddress
        baseTextView.autocapitalizationType = .none

        baseTextView.addTarget(self, action: #selector(userNameAddDomain), for: .editingChanged)

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
                usernameTextField,
                passwordTextField,
                confirmPasswordTextField
        )
    }

    override func setupConstraints() {

        usernameTextField.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor
        )

        passwordTextField.anchor(
                top: usernameTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 2.5)
        )

        confirmPasswordTextField.anchor(
                top: usernameTextField.bottomAnchor,
                leading: centerXAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 2.5, bottom: 0, right: 0)
        )
    }

    func setUser(user: User) {
        usernameTextField.text = user.username
        passwordTextField.placeholder = "Nova senha"
    }

    @objc func userNameAddDomain() {
        if let text = usernameTextField.text {
            if text.prefix(1) == "@" {
                return
            }

            let usernameSplit = text.split(separator: "@")

            if usernameSplit.count < 1 {
                return;
            }

            var username = usernameSplit[0]

            let arbitraryValue: Int = username.count

            if let domain = domain {
                username = username + "@" + domain
            }

            if let newPosition = usernameTextField.position(from: usernameTextField.beginningOfDocument, offset: arbitraryValue) {

                usernameTextField.selectedTextRange = usernameTextField.textRange(from: newPosition, to: newPosition)
            }

            usernameTextField.text = "\(username)"
        }

        textFieldChange()
    }

    @objc func textFieldChange() {
        isValid = usernameTextField.text ?? "" != "" &&
                passwordTextField.text ?? "" != "" &&
                passwordTextField.text == confirmPasswordTextField.text

        inputChange()
    }
}
