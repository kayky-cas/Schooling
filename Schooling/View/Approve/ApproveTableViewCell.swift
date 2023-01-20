//
// Created by unicred on 18/01/23.
//

import UIKit

class ApproveTableViewCell: UITableViewCell {
    lazy var rightLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.textColor = .tintColor
        uiLabel.font = .italicSystemFont(ofSize: 15)

        return uiLabel
    }()

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup(name: String, role: String, domain: String) {
        addSubviews(rightLabel)

        textLabel?.text = name
        rightLabel.text = "\(role)@\(domain)"

        setupRightLabel(role: role, domain: domain)

        setupConstraints()
    }

    func setupRightLabel(role: String, domain: String) {

        let fontSize = 15.0

        let normalText = role
        let normalTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.tintColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)
        ]

        let normalTextAttrString = NSAttributedString(string: normalText, attributes: normalTextAttr)

        let signUpText = "@\(domain)"
        let signUpTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.tintColor,
            NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: fontSize)
        ]

        let signUpTextAttrString = NSAttributedString(string: signUpText, attributes: signUpTextAttr)

        let attributedText = NSMutableAttributedString()
        attributedText.append(normalTextAttrString)
        attributedText.append(signUpTextAttrString)

        rightLabel.attributedText = attributedText
    }

    func setupConstraints() {
        rightLabel.anchor(
                trailing: textLabel?.trailingAnchor
        )

        rightLabel.anchorCenterY(to: centerYAnchor)
    }
}
