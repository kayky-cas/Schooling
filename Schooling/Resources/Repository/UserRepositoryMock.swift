//
// Created by unicred on 16/01/23.
//

import Foundation

class UserRepositoryMock {
    static let shared = UserRepositoryMock()

    private init() {
        users[1].subject_id = SubjectRepositoryMock.shared.subjects[1].id
    }

    var users: [User] = [
        .init(name: "Kayky Casagrande", cpf: "000.000.000-00", username: "kayky.casagrande", password: "12345", role: .student),
        .init(name: "Kauê Ferdinando Ludivico", cpf: "000.000.000-01", username: "kaue.ludivico", password: "12345", role: .teacher),
        .init(name: "Maria Aida", cpf: "000.000.000-02", username: "maria.aida", password: "12345", role: .student),
        .init(name: "Mariana Diniz", cpf: "000.000.000-03", username: "mariana.diniz", password: "12345", role: .student),
        .init(name: "Lucas Parolin", cpf: "000.000.000-04", username: "lucas.parolin", password: "12345", role: .student),
    ]

    func getUsers(completion: @escaping ([User]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.users)
        }
    }
}
