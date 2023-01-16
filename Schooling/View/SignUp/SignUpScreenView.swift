//
// Created by unicred on 13/01/23.
//

import UIKit

class SignUpScreenView: BaseScreenView {
    lazy var signUpLogo: UIImageView = {
        let uiImageView = UIImageView()

        uiImageView.image = UIImage(systemName: "paperplane.fill")
        uiImageView.contentMode = .scaleAspectFit

        return uiImageView
    }()

    lazy var titleLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Solicitação de Conta"
        uiLabel.textAlignment = .center
        uiLabel.font = .boldSystemFont(ofSize: 26)
        uiLabel.textColor = .tintColor

        return uiLabel
    }()

    lazy var signUpFormView = SignUpFormView()

    lazy var signUpButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Enviar solicitação", for: .normal)
        uiButton.isEnabled = false

        return uiButton
    }()

    var schools: [String]? {
        didSet {
            if let schools = schools {
                signUpFormView.schools = schools
            }
        }
    }

    override func setup() {
        addSubviews(
                signUpLogo,
                titleLabel,
                signUpFormView,
                signUpButton
        )

        signUpFormView.isValid = {
            self.signUpButton.isEnabled = $0
        }
    }

    override func setupConstraints() {
        signUpLogo.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                size: .init(width: 100, height: 100)
        )

        signUpLogo.anchorCenterX(to: centerXAnchor)

        titleLabel.anchor(
                top: signUpLogo.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )

        signUpButton.anchor(
                bottom: safeAreaLayoutGuide.bottomAnchor,
                padding: .init(top: 0, left: 0, bottom: 20, right: 0)
        )

        signUpButton.anchorCenterX(to: centerXAnchor)

        signUpFormView.anchorBaseView(
                top: titleLabel.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 50, left: 20, bottom: 0, right: 20)
        )
    }
}
