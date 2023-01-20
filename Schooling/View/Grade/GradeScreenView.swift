//
// Created by unicred on 18/01/23.
//

import UIKit

class GradeScreenView: BaseScreenView {
    var addGrade: (Grade) -> Void = { _ in
    }

    var user: User? {
        didSet {
            if user?.role == .teacher {
                titleLabel.font = .boldSystemFont(ofSize: 30)
            }
        }
    }

    var title: String? {
        didSet {
            if let title = title {
                titleLabel.text = title
            }
        }
    }

    var subject: Subject? {
        didSet {
        }
    }

    var grades: [Grade]? {
        didSet {
        }
    }

    lazy var titleLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.textAlignment = .center
        uiLabel.font = .boldSystemFont(ofSize: 40)
        uiLabel.textColor = .tintColor

        return uiLabel
    }()

    lazy var gradeFormView = GradeFormView()

    let gradeTableView = GradeTableView()

    override func setup() {
        addSubviews(titleLabel, gradeFormView, gradeTableView)

        gradeFormView.addGrade = { [self] in
            let grade = Grade(
                    name: gradeFormView.gradeNameTextField.text!,
                    value: Double(gradeFormView.gradeValueTextField.text!)!
            )

            addGrade(grade)

            gradeTableView.reloadData()
        }
    }

    override func setupConstraints() {
        titleLabel.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )

        var gradeTopAnchor = titleLabel.bottomAnchor

        if (user?.role == .teacher) {
            gradeFormView.anchorBaseView(
                    top: titleLabel.bottomAnchor,
                    leading: leadingAnchor,
                    trailing: trailingAnchor,
                    padding: .init(top: 20, left: 20, bottom: 0, right: 20)
            )

            gradeTopAnchor = gradeFormView.bottomAnchor
        }

        gradeTableView.anchor(
                top: gradeTopAnchor,
                leading: leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 20, left: 4, bottom: 0, right: 20)
        )
    }
}
