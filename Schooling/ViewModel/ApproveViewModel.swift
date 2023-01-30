//
// Created by unicred on 19/01/23.
//

import Foundation

class ApproveViewModel {
    let userRepository = UserRepositoryMock.shared
    let schoolRepository = SchoolRepositoryMock.shared

    func getClosedAccounts(completion: @escaping ([(User, School)]) -> Void) {

        userRepository.getUsers { users in
            self.schoolRepository.getSchools { schools in
                let usersAndSchools = users.filter({ user in
                            !user.is_open && user.schoolId != nil
                        })
                        .map { user in
                            (user, schools.first {
                                $0.id == user.schoolId
                            }!)
                        }

                completion(usersAndSchools)
            }
        }
    }

    func approveUser(userId: UUID, completion: @escaping () -> Void) {
        if let (index, _) = userRepository.users.enumerated().first(where: { $1.id == userId }) {
            userRepository.users[index].is_open = true
        }

        completion()
    }
}
