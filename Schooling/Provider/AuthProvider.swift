//
// Created by unicred on 17/01/23.
//

import Foundation

class AuthProvider {
    static let shared = AuthProvider()

    private init() {
    }

    private var user: User?

    func getUser() -> User? {
        user
    }

    func setUser(user: User) {
        self.user = user
    }

    func isLogged() -> Bool {
        user != nil
    }

    func logout() {
        user = nil
    }
}
