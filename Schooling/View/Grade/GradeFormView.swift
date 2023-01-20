//
// Created by unicred on 19/01/23.
//

import UIKit

class GradeFormView: BaseView {
    var addGrade: () -> Void = {
    }

    private var oldValue = ""

    lazy var gradeNameTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "Trabalho"
        baseTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        return baseTextField
    }()

    lazy var gradeValueTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "Nota"
        baseTextField.addTarget(self, action: #selector(valueTextFieldChange), for: .editingChanged)

        return baseTextField
    }()

    lazy var addGradeButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Adicionar Nota", for: .normal)
        uiButton.isEnabled = false
        uiButton.addTarget(self, action: #selector(touchUpInsideAddButton), for: .touchUpInside)

        return uiButton
    }()

    override func setup() {
        addSubviews(gradeNameTextField, gradeValueTextField, addGradeButton)
    }

    override func setupConstraints() {
        gradeNameTextField.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 5)
        )

        gradeValueTextField.anchor(
                top: topAnchor,
                leading: centerXAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 0, left: 5, bottom: 0, right: 0)
        )

        addGradeButton.anchor(
                top: gradeValueTextField.bottomAnchor,
                padding: .init(top: 30, left: 0, bottom: 0, right: 0)
        )

        addGradeButton.anchorCenterX(to: centerXAnchor)
    }

    @objc func valueTextFieldChange() {
        var text = gradeValueTextField.text ?? ""

        if let num = Double(text) {
            if num > 10 {
                text = "10"
            }

            oldValue = text
        } else {
            if text != "" {
                text = oldValue
            }
        }

        gradeValueTextField.text = text

        textFieldChange()
    }

    @objc func textFieldChange() {
        addGradeButton.isEnabled = gradeNameTextField.text != "" && gradeValueTextField.text != ""
    }

    @objc func touchUpInsideAddButton() {
        addGrade()
    }
}
