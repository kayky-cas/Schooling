//
//  AppDelegate.swift
//  Schooling
//
//  Created by unicred on 13/01/23.
//
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        AuthProvider.shared.setUser(user: UserRepositoryMock.shared.users[5])

        let navigationController = BaseNavigationController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = STUDENT_COLOR
        window?.rootViewController = navigationController
//        window?.rootViewController = BaseTabViewController()
        window?.makeKeyAndVisible()

        // Override point for customization after application launch.
        return true
    }
}
