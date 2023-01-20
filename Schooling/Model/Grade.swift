//
// Created by unicred on 16/01/23.
//

import Foundation

struct Grade {
    let id: UUID

    let name: String
    let value: Double

    var user_id: UUID?
    var subject_id: UUID?

    init(name: String, value: Double) {
        id = .init()

        self.name = name
        self.value = value

        user_id = nil
        subject_id = nil
    }
}
