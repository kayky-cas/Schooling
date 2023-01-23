//
// Created by unicred on 16/01/23.
//

import Foundation

class UserRepositoryMock {
    static let shared = UserRepositoryMock()

    private init() {
        users[1].subject_id = SubjectRepositoryMock.shared.subjects[1].id

        users[0].is_open = true
        users[5].is_open = true
        users[1].is_open = true

        for x in 0..<users.count {
            if users[x].role != .admin {
                users[x].school_id = SchoolRepositoryMock.shared.schools[1].id
            }
        }
    }

    var users: [User] = [
        .init(name: "Kayky Casagrande", cpf: "000.000.000-00", username: "kayky.casagrande", password: "12345", role: .student),
        .init(name: "Kauê Ferdinando Ludivico", cpf: "000.000.000-01", username: "kaue.ludivico", password: "12345", role: .teacher),
        .init(name: "Maria Aida", cpf: "000.000.000-02", username: "maria.aida", password: "12345", role: .student),
        .init(name: "Mariana Diniz", cpf: "000.000.000-03", username: "mariana.diniz", password: "12345", role: .student),
        .init(name: "Lucas Parolin", cpf: "000.000.000-04", username: "lucas.parolin", password: "12345", role: .student),
        .init(name: "Petry", cpf: "000.000.000-05", username: "petry", password: "12345", role: .admin),
    ]

    func getUsers(completion: @escaping ([User]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.users)
        }
    }

    func addUser(user: User, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.users.append(user)
            completion()
        }
    }
}
