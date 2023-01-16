//
// Created by unicred on 16/01/23.
//

import UIKit

class SignUpSchoolFormView: BaseView {
    var isValid: Bool = false

    var inputChange: () -> Void = {
    }

    lazy var schoolLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Nome da Escola: "
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var schoolOptionButton: UIButton = {
        let uiButton = UIButton(configuration: .borderless())

        uiButton.setTitle("Escola", for: .normal)
        uiButton.showsMenuAsPrimaryAction = true

        return uiButton
    }()

    override func setup() {

        addSubviews(
                schoolLabel,
                schoolOptionButton
        )
    }

    override func setupConstraints() {
        schoolOptionButton.anchor(
                top: topAnchor
        )

        schoolLabel.anchor(
                leading: leadingAnchor
        )

        schoolLabel.anchorCenterY(to: schoolOptionButton.centerYAnchor)

        schoolOptionButton.leadingAnchor.constraint(equalTo: schoolLabel.trailingAnchor).isActive = true
    }

    func setSchools(schools: [String]) {
        schoolOptionButton.menu = UIMenu(children: schools.map({
            UIAction(title: $0, image: UIImage(systemName: "books.vertical")) { action in
                self.schoolOptionButton.setTitle(action.title, for: .normal)
                self.isValid = true
                self.inputChange()
            }
        }))
    }
}
