//
// Created by unicred on 16/01/23.
//

import Foundation

class SubjectRepositoryMock {
    static let shared = SubjectRepositoryMock()

    private let names = ["História", "Geográfia", "Matemática", "Português"]

    var subjects: [Subject]

    private init() {
        subjects = names.sorted().map({ Subject(id: .init(), name: $0) })
    }

    func getSubjects(completion: @escaping ([Subject]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            completion(self.subjects)
        }
    }
}
