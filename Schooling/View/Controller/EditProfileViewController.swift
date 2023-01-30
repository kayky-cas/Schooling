//
// Created by unicred on 30/01/23.
//

import Foundation

class EditProfileViewController: BaseViewController {
    let editProfileViewModel = EditProfileViewModel()
    let editProfileScreenView = EditProfileScreenView()

    override func loadView() {
        super.loadView()
        view = editProfileScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        editProfileScreenView.updateUser = { user in
            self.editProfileViewModel.editUser(user: user) {
                AuthProvider.shared.setUser(user: user)
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }

    func setUser(user: User) {
        editProfileScreenView.setUser(user: user)
    }
}
