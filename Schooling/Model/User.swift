//
// Created by unicred on 16/01/23.
//

import Foundation

struct User {
    var id: UUID
    var name: String
    var cpf: String

    var username: String
    var password: String

    var subjectId: UUID?

    var role: Role

    var schoolId: UUID?

    var is_open: Bool

    var registerDate: Date

    init(name: String, cpf: String, username: String, password: String, role: Role) {
        id = .init()
        self.name = name
        self.cpf = cpf
        self.username = username
        self.password = password
        self.role = role
        schoolId = nil
        is_open = false
        registerDate = Date()
    }

    init(id: UUID, name: String, cpf: String, username: String, password: String, role: Role, is_open: Bool) {
        self.id = id
        self.name = name
        self.cpf = cpf
        self.username = username
        self.password = password
        self.role = role
        schoolId = nil
        self.is_open = is_open
        registerDate = Date()
    }
}

enum Role {
    case admin
    case teacher
    case student
}