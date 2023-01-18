//
// Created by unicred on 18/01/23.
//

import UIKit

class GradeScreenView: BaseScreenView {
    var subject: Subject? {
        didSet {
            if let subject = subject {
                subjectNameLabel.text = subject.name
            }
        }
    }

    var grades: [Grade]? {
        didSet {
        }
    }

    lazy var subjectNameLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.textAlignment = .center
        uiLabel.font = .boldSystemFont(ofSize: 40)
        uiLabel.textColor = .tintColor

        return uiLabel
    }()

    let gradeTableView = GradeTableView()

    override func setup() {
        addSubviews(subjectNameLabel, gradeTableView)
    }

    override func setupConstraints() {
        subjectNameLabel.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )

        gradeTableView.anchor(
                top: subjectNameLabel.bottomAnchor,
                leading: leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )
    }
}
