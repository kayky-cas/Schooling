//
// Created by unicred on 23/01/23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    init() {
        super.init(rootViewController: LoginViewController())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
