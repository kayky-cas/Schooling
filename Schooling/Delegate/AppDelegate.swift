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

        let rootViewController = LoginViewController()
//        let rootViewController = SignUpViewController()

        let navigationController = UINavigationController(rootViewController: rootViewController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .systemTeal
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        // Override point for customization after application launch.
        return true
    }
}
