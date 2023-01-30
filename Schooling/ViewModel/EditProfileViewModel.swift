//
// Created by unicred on 30/01/23.
//

import Foundation

class EditProfileViewModel {
    let repository = UserRepositoryMock.shared

    func editUser(user: User, completion: @escaping () -> Void) {
        let index = repository.users.firstIndex(where: { $0.id == user.id })

        repository.users[index!] = user
        completion()
    }
}
