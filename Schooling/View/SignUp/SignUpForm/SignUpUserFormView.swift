//
// Created by unicred on 16/01/23.
//

import UIKit

class SignUpUserFormView: BaseView {

    var isValid: Bool = false

    var inputChange: () -> Void = {
    }

    lazy var nameTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "Nome completo"
        baseTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        return baseTextField
    }()

    lazy var cpfTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "CPF"
        baseTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        return baseTextField
    }()

    override func setup() {
        addSubviews(
                nameTextField,
                cpfTextField
        )
    }

    override func setupConstraints() {
        nameTextField.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor
        )

        cpfTextField.anchor(
                top: nameTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )
    }

    func setUser(user: User) {
        nameTextField.text = user.name
        cpfTextField.text = user.cpf
    }


    @objc func textFieldChange() {
        isValid = nameTextField.text ?? "" != ""
        inputChange()
    }
}