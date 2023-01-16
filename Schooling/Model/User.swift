//
// Created by unicred on 16/01/23.
//

import Foundation

struct User {
    let id: UUID
    let name: String

    let username: String
    let password: String

    let role: Role

    let school_id: UUID?

    let is_open: Bool

    init(name: String, username: String, password: String, role: Role) {
        id = .init()
        self.name = name
        self.username = username
        self.password = password
        self.role = role
        school_id = nil
        is_open = false
    }
}

enum Role {
    case admin
    case teacher
    case student
}