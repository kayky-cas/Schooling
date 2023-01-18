//
// Created by unicred on 16/01/23.
//

import Foundation

struct User {
    let id: UUID
    let name: String
    let cpf: String

    let username: String
    let password: String

    var subject_id: UUID?

    let role: Role

    var school_id: UUID?

    let is_open: Bool

    init(name: String, cpf: String, username: String, password: String, role: Role) {
        id = .init()
        self.name = name
        self.cpf = cpf
        self.username = username
        self.password = password
        self.role = role
        school_id = nil
        is_open = false
    }

    init(id: UUID, name: String, cpf: String, username: String, password: String, role: Role, is_open: Bool) {
        self.id = id
        self.name = name
        self.cpf = cpf
        self.username = username
        self.password = password
        self.role = role
        school_id = nil
        self.is_open = is_open
    }
}

enum Role {
    case admin
    case teacher
    case student
}