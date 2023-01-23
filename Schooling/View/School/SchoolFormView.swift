//
// Created by unicred on 23/01/23.
//

import UIKit

class SchoolFormView: BaseView {
    var createSchool: (School) -> Void = { _ in
    }

    lazy var nameTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "Nome da Escola"
        baseTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

        return baseTextField
    }()

    lazy var domainTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "@escola"
        baseTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

        return baseTextField
    }()

    lazy var createSchoolButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Adicionar", for: .normal)
        uiButton.setTitle("Preencha todos os dados", for: .disabled)

        uiButton.isEnabled = false

        uiButton.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)

        return uiButton
    }()

    override func setup() {
        addSubviews(nameTextField, domainTextField, createSchoolButton)
    }

    override func setupConstraints() {
        nameTextField.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 5)
        )

        domainTextField.anchor(
                top: topAnchor,
                leading: centerXAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 0, left: 5, bottom: 0, right: 0)
        )

        createSchoolButton.anchor(
                top: domainTextField.bottomAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )

        createSchoolButton.anchorCenterX(to: centerXAnchor)
    }

    @objc func textFieldChanged() {
        createSchoolButton.isEnabled = nameTextField.text ?? "" != "" && domainTextField.text ?? "" != ""
    }

    @objc func touchUpInside() {
        let school = School(name: nameTextField.text!, domain: domainTextField.text!)

        nameTextField.text = ""
        domainTextField.text = ""

        createSchool(school)
    }
}
