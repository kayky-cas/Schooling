//
// Created by unicred on 17/01/23.
//

import UIKit

class ProfileViewController: BaseViewController {
    let authProvider = AuthProvider.shared
    let profileViewModel = ProfileViewModel()

    let profileScreenView = ProfileScreenView()

    override func loadView() {
        super.loadView()

        view = profileScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configScreenView()
    }

    func logout() {
        authProvider.logout()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = BaseNavigationController()
    }

    func editProfile() {
        let editProfileViewController = EditProfileViewController()

        editProfileViewController.setUser(user: authProvider.getUser()!)

        navigationController?.pushViewController(editProfileViewController, animated: true)
    }

    func configScreenView() {
        profileScreenView.user = authProvider.getUser()
        profileScreenView.logout = logout
        profileScreenView.editProfile = editProfile

        if authProvider.getUser()?.role == .teacher {
            profileViewModel.getTeacherSubject(subjectId: authProvider.getUser()!.subjectId!) {
                self.profileScreenView.subject = $0
            }
        }
    }
}
