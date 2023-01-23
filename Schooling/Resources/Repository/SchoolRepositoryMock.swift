//
// Created by unicred on 16/01/23.
//

import Foundation

class SchoolRepositoryMock {
    static let shared = SchoolRepositoryMock()

    private init() {
    }

    var schools: [School] = [
        .init(name: "PUCRS", domain: "pucrs"),
        .init(name: "Zallpy Academy", domain: "zallpy")
    ]

    func getSchools(completion: @escaping ([School]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.schools)
        }
    }

    func addSchools(school: School, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.schools.append(school)
            completion()
        }
    }
}
