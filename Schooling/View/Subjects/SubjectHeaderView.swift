//
// Created by unicred on 18/01/23.
//

import UIKit

class SubjectHeaderView: BaseView {
    lazy var subjectLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Matéria"
        uiLabel.font = .boldSystemFont(ofSize: 15)
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var averageGradesLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Média de notas"
        uiLabel.font = .boldSystemFont(ofSize: 15)
        uiLabel.textColor = .gray

        return uiLabel
    }()

    override func setup() {
        addSubviews(subjectLabel, averageGradesLabel)
    }

    override func setupConstraints() {
        subjectLabel.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                padding: .init(top: 0, left: 20, bottom: 20, right: 0)
        )

        averageGradesLabel.anchor(
                trailing: trailingAnchor,
                padding: .init(top: 0, left: 0, bottom: 20, right: 20)
        )
    }
}
