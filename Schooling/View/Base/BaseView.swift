//
// Created by unicred on 16/01/23.
//

import UIKit

class BaseView: BaseScreenView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func anchorBaseView(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        anchor(top: top, leading: leading, bottom: bottom, trailing: trailing, padding: padding, size: size)

        setupConstraints()

        if let lastSubView = subviews.last {
            bottomAnchor.constraint(equalTo: lastSubView.bottomAnchor).isActive = true
        }
    }
}