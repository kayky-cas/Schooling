//
// Created by unicred on 16/01/23.
//

import Foundation

struct Grade {
    let id: UUID

    let name: String
    let value: Double

    var userId: UUID?
    var subjectId: UUID?

    init(name: String, value: Double) {
        id = .init()

        self.name = name
        self.value = value

        userId = nil
        subjectId = nil
    }
}
