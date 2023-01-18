//
// Created by unicred on 17/01/23.
//

import UIKit

class BaseTapViewController: UITabBarController {
    let authProvider = AuthProvider.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        verifyLoggedUser()

        tabBar.backgroundColor = .secondarySystemBackground

        viewControllers = [
            generateNavController(controller: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person.fill"))
        ]

        getViewController()
    }

    private func getViewController() {

        if let role = authProvider.getUser()?.role {
            switch role {
            case .student:
                viewControllers?.append(generateNavController(controller: SubjectViewController(), title: "Matérias", image: UIImage(systemName: "books.vertical.fill")))
                break
            case .teacher:
                viewControllers?.append(generateNavController(controller: StudentViewController(), title: "Alunos", image: UIImage(systemName: "pencil")))
                break
            case .admin:
                viewControllers?.append(generateNavController(controller: SubjectViewController(), title: "Aprovar", image: UIImage(systemName: "checkmark")))
                viewControllers?.append(generateNavController(controller: SubjectViewController(), title: "Escolas", image: UIImage(systemName: "building.2.fill")))
                break
            }
        }
    }

    private func generateNavController(controller: BaseViewController, title: String, image: UIImage?) -> UINavigationController {
        controller.navigationItem.title = title

        let navigationController = UINavigationController(rootViewController: controller)

        navigationController.title = title
        navigationController.tabBarItem.image = image

        return navigationController
    }

    private func verifyLoggedUser() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if !authProvider.isLogged() {
            appDelegate.window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            return
        }

        switch authProvider.getUser()!.role {
        case .teacher:
            appDelegate.window?.tintColor = TEACHER_COLOR
        case .admin:
            appDelegate.window?.tintColor = ADMIN_COLOR
        case .student:
            appDelegate.window?.tintColor = STUDENT_COLOR
        }
    }
}
