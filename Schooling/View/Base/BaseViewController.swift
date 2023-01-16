//
// Created by unicred on 13/01/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        if let view = view as? BaseScreenView {
            view.setup()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let view = view as? BaseScreenView {
            view.setupConstraints()
        }
    }
}
