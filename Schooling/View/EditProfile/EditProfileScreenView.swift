//
// Created by unicred on 30/01/23.
//

import UIKit

class EditProfileScreenView: BaseScreenView {
    var updateUser: (User) -> Void = { _ in
    }
    var user: User?

    lazy var editImage: UIImageView = {
        let uiImageView = UIImageView()

        uiImageView.image = UIImage(systemName: "pencil")

        return uiImageView
    }()

    lazy var editTitleLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Edit Profile"
        uiLabel.font = .boldSystemFont(ofSize: 40)
        uiLabel.textColor = .tintColor
        uiLabel.textAlignment = .center
        return uiLabel

    }()

    lazy var signUpUserFormView = SignUpUserFormView()
    lazy var signUpLoginFormView = SignUpLoginFormView()

    lazy var editButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Editar", for: .normal)
        uiButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        uiButton.addTarget(self, action: #selector(editButtonTouchUpInside), for: .touchUpInside)

        return uiButton
    }()

    override func setup() {
        addSubviews(editImage, editTitleLabel, signUpUserFormView, signUpLoginFormView, editButton)
    }

    override func setupConstraints() {
        editImage.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                size: .init(width: 60, height: 60)
        )

        editImage.anchorCenterX(to: centerXAnchor)

        editTitleLabel.anchor(
                top: editImage.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )

        signUpUserFormView.anchorBaseView(
                top: editTitleLabel.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 30, left: 30, bottom: 0, right: 30)
        )

        signUpLoginFormView.anchorBaseView(
                top: signUpUserFormView.safeAreaLayoutGuide.bottomAnchor,
                leading: signUpUserFormView.leadingAnchor,
                trailing: signUpUserFormView.trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )

        editButton.anchor(
                bottom: safeAreaLayoutGuide.bottomAnchor,
                padding: .init(top: 0, left: 0, bottom: 50, right: 0)
        )

        editButton.anchorCenterX(to: centerXAnchor)
    }

    func setUser(user: User) {
        signUpUserFormView.setUser(user: user)
        signUpLoginFormView.setUser(user: user)

        self.user = user
    }

    @objc func editButtonTouchUpInside() {
        var user = user!

        user.name = signUpUserFormView.nameTextField.text!
        user.cpf = signUpUserFormView.cpfTextField.text!
        user.username = signUpLoginFormView.usernameTextField.text!
        user.password = signUpLoginFormView.passwordTextField.text! == "" ? user.password : signUpLoginFormView.passwordTextField.text!

        updateUser(user)
    }
}
