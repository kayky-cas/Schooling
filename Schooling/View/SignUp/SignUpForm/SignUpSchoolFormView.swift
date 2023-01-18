//
// Created by unicred on 16/01/23.
//

import UIKit

class SignUpSchoolFormView: BaseView {
    var isValid: Bool = false

    var inputChange: () -> Void = {
    }

//    lazy var schoolLabel: UILabel = {
//        let uiLabel = UILabel()
//
//        uiLabel.text = "Nome da Escola: "
//        uiLabel.textColor = .systemGray3
//
//        return uiLabel
//    }()

    lazy var schoolOptionButton: UIButton = {
        let uiButton = UIButton(configuration: .borderless())

        uiButton.setTitle("Escola", for: .normal)
        uiButton.showsMenuAsPrimaryAction = true

        return uiButton
    }()

    lazy var roleSwitch: UISwitch = {
        let uiSwitch = UISwitch()

        uiSwitch.onTintColor = TEACHER_COLOR
        uiSwitch.subviews[0].subviews[0].backgroundColor = STUDENT_COLOR
        uiSwitch.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)

        uiSwitch.isOn = UIColor.tintColor.accessibilityName == TEACHER_COLOR.accessibilityName

        return uiSwitch
    }()

    lazy var studentLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Aluno"
        uiLabel.textColor = STUDENT_COLOR

        return uiLabel
    }()

    lazy var teacherLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Professor"
        uiLabel.textColor = TEACHER_COLOR

        return uiLabel
    }()

    override func setup() {

        addSubviews(
//                schoolLabel,
                schoolOptionButton,
                studentLabel,
                teacherLabel,
                roleSwitch
        )
    }

    override func setupConstraints() {
        schoolOptionButton.anchor(
                top: topAnchor
//                padding: .init(top: 0, left: 0, bottom: 0, right: 0
        )

        schoolOptionButton.anchorCenterX(to: centerXAnchor)

//        schoolLabel.anchor(
//                leading: leadingAnchor
//        )
//
//        schoolLabel.anchorCenterY(to: schoolOptionButton.centerYAnchor)

//        schoolOptionButton.leadingAnchor.constraint(equalTo: schoolLabel.trailingAnchor).isActive = true

        roleSwitch.anchor(
                top: schoolOptionButton.bottomAnchor,
                padding: .init(top: 15, left: 0, bottom: 0, right: 0)
        )

        roleSwitch.anchorCenterX(to: centerXAnchor)

        studentLabel.anchorCenterY(to: roleSwitch.centerYAnchor)

        studentLabel.anchor(
                trailing: roleSwitch.leadingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 15)
        )

        teacherLabel.anchorCenterY(to: roleSwitch.centerYAnchor)

        teacherLabel.anchor(
                leading: roleSwitch.trailingAnchor,
                padding: .init(top: 0, left: 15, bottom: 0, right: 0)
        )
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

    @objc func switchValueDidChange() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.tintColor = roleSwitch.isOn ? TEACHER_COLOR : STUDENT_COLOR
    }
}
