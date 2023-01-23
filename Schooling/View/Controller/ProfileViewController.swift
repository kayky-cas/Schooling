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

        profileScreenView.user = authProvider.getUser()
        profileScreenView.logout = logout

        if authProvider.getUser()?.role == .teacher {
            profileViewModel.getTeacherSubject(subjectId: authProvider.getUser()!.subject_id!) {
                self.profileScreenView.subject = $0
            }
        }
    }

    func logout() {
        authProvider.logout()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = BaseNavigationController()
    }
}
