//
// Created by unicred on 16/01/23.
//

import UIKit

class SignUpSchoolFormView: BaseView {
    var isValid: Bool = false

    var changeSchool: (School) -> Void = { _ in
    }

    var inputChange: () -> Void = {
    }

    var subject: Subject?
    var school: School?
    var role: Role = .student

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

    lazy var subjectOptionButton: UIButton = {
        let uiButton = UIButton(configuration: .borderless())

        uiButton.setTitle("Matéria", for: .normal)
        uiButton.showsMenuAsPrimaryAction = true

        uiButton.isHidden = true

        return uiButton
    }()

    override func setup() {

        addSubviews(
//                schoolLabel,
                schoolOptionButton,
                studentLabel,
                teacherLabel,
                roleSwitch,
                subjectOptionButton
        )
    }

    override func setupConstraints() {
        schoolOptionButton.anchor(
                top: topAnchor
        )

        schoolOptionButton.anchorCenterX(to: centerXAnchor)

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

        subjectOptionButton.anchor(
                top: teacherLabel.bottomAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )

        subjectOptionButton.anchorCenterX(to: centerXAnchor)
    }

    func setSchools(schools: [School]) {
        schoolOptionButton.menu = UIMenu(children: schools.map({ school in
            UIAction(title: school.name, image: UIImage(systemName: "books.vertical")) { action in
                self.schoolOptionButton.setTitle(action.title, for: .normal)
                self.school = school
                self.changeSchool(school)
                self.verifyValidation()
            }
        }))
    }

    func setSubjects(subjects: [Subject]) {
        subjectOptionButton.menu = UIMenu(children: subjects.map({ subject in
            UIAction(title: subject.name, image: UIImage(systemName: "book")) { action in
                self.subjectOptionButton.setTitle(action.title, for: .normal)
                self.subject = subject
                self.verifyValidation()
            }
        }))
    }

    @objc func switchValueDidChange() {
        subjectOptionButton.isHidden = !roleSwitch.isOn

        role = roleSwitch.isOn ? .teacher : .student

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.tintColor = roleSwitch.isOn ? TEACHER_COLOR : STUDENT_COLOR

        verifyValidation()
    }

    func verifyValidation() {
        isValid = school != nil

        if roleSwitch.isOn {
            isValid = isValid && subject != nil
        }

        inputChange()
    }
}
