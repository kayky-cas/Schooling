//
// Created by unicred on 23/01/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    lazy var rightLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.textColor = .tintColor

        return uiLabel
    }()

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup(name: String, domain: String) {
        addSubviews(rightLabel)

        textLabel?.text = name
        rightLabel.text = "@" + domain

        setupConstraints()
    }

    func setupConstraints() {
        rightLabel.anchor(
                trailing: textLabel?.trailingAnchor
        )

        rightLabel.anchorCenterY(to: centerYAnchor)
    }
}