//
// Created by unicred on 13/01/23.
//

import UIKit

class LoginScreenView: BaseScreenView {
    var signUpTouchUpInsideAction: () -> Void = {
    }

    lazy var logoImage: UIImageView = {
        let uiImageView = UIImageView()

        uiImageView.image = UIImage(systemName: "books.vertical.circle.fill")
        uiImageView.contentMode = .scaleAspectFit

        return uiImageView
    }()

    lazy var loginFormView = LoginFormView()

    lazy var forgotPasswordLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Esqueceu a senha?"
        uiLabel.textColor = .systemGray3
        uiLabel.textAlignment = .right

        return uiLabel
    }()

    lazy var loginButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Entrar", for: .normal)
        uiButton.isEnabled = false

        return uiButton
    }()

    lazy var signUpLabel: UILabel = {
        let uiLabel = UILabel()

        let fontSize = 15.0

        let normalText = "Se você não tiver uma conta, solicite uma ao administrador da sua escola "
        let normalTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)
        ]

        let normalTextAttrString = NSAttributedString(string: normalText, attributes: normalTextAttr)

        let signUpText = "aqui"
        let signUpTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.tintColor,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)
        ]

        let signUpTextAttrString = NSAttributedString(string: signUpText, attributes: signUpTextAttr)

        let attributedText = NSMutableAttributedString()
        attributedText.append(normalTextAttrString)
        attributedText.append(signUpTextAttrString)

        uiLabel.attributedText = attributedText

        uiLabel.numberOfLines = 0

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpTouchUpInside))

        uiLabel.addGestureRecognizer(tapGestureRecognizer)
        uiLabel.isUserInteractionEnabled = true

        uiLabel.textAlignment = .justified

        return uiLabel
    }()

    override func setup() {
        addSubviews(logoImage, loginFormView, forgotPasswordLabel, loginButton, signUpLabel)

        loginFormView.isValid = {
            self.loginButton.isEnabled = $0
        }

    }

    override func setupConstraints() {
        logoImage.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                size: .init(width: 200, height: 200)
        )

        logoImage.anchorCenterX(to: centerXAnchor)

        signUpLabel.anchor(
                bottom: safeAreaLayoutGuide.bottomAnchor,
                size: .init(width: 250, height: 0)
        )

        signUpLabel.anchorCenterX(to: centerXAnchor)

        loginButton.anchor(
                bottom: signUpLabel.topAnchor,
                padding: .init(top: 0, left: 0, bottom: 20, right: 0),
                size: .init(width: 130, height: 0)
        )

        loginButton.anchorCenterX(to: centerXAnchor)

        let padding = 30.0

        loginFormView.anchorBaseView(
                top: logoImage.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 50, left: padding, bottom: 0, right: padding)
        )

        forgotPasswordLabel.anchor(
                top: loginFormView.bottomAnchor,
                leading: loginFormView.leadingAnchor,
                trailing: loginFormView.trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )
    }

    @objc func signUpTouchUpInside() {
        signUpTouchUpInsideAction()
    }
}
