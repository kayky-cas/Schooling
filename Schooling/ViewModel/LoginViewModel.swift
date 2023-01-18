//
// Created by unicred on 17/01/23.
//

import Foundation

class LoginViewModel {
    let repository = UserRepositoryMock.shared

    func login(email: String, password: String, completion: @escaping (User?) -> Void) {
        let username = "\(email.split(separator: "@").first ?? "")"

        if username == "" {
            completion(nil)
            return
        }

        repository.getUsers {
            completion($0.first(where: {
                $0.username == username && $0.password == password
            }))
        }
    }
}