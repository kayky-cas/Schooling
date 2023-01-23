//
// Created by unicred on 23/01/23.
//

import UIKit

class SchoolScreenView: BaseScreenView {
    var createSchool: ((School) -> Void)? {
        didSet {
            schoolFormView.createSchool = createSchool!
        }
    }

    lazy var schoolFormView = SchoolFormView()

    lazy var schoolTableView = SchoolTableView()

    override func setup() {
        addSubviews(schoolFormView, schoolTableView)
    }

    override func setupConstraints() {
        let padding = 15.0

        schoolFormView.anchorBaseView(
                top: safeAreaLayoutGuide.topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 0, left: padding, bottom: 0, right: padding)
        )

        schoolTableView.anchor(
                top: schoolFormView.bottomAnchor,
                leading: leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )
    }
}
