//
// Created by unicred on 16/01/23.
//

import Foundation

struct School {
    let id: UUID

    let name: String
    let domain: String

    init(name: String, domain: String) {
        id = .init()
        self.name = name
        self.domain = domain
    }
}
