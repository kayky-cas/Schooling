//
// Created by unicred on 16/01/23.
//

import UIKit

class LoadingAlert: UIAlertController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let indicator = UIActivityIndicatorView(frame: .init(x: 10, y: 5, width: 50, height: 50))

        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        indicator.color = .tintColor


        view.addSubview(indicator)
    }
}
