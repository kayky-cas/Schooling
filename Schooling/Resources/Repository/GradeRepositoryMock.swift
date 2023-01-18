//
// Created by unicred on 16/01/23.
//

import Foundation

class GradeRepositoryMock {
    static let shared = GradeRepositoryMock()

    var grades: [Grade] = []

    private let names = [
        "Creiulson",
        "Prova Claudio",
        "Tvson"
    ]

    private init() {
        for _ in 0...20 {
            let grade = Grade(
                    id: .init(),
                    name: names[Int.random(in: 0..<names.count)],
                    value: Double.random(in: 0...10),
                    user_id: UserRepositoryMock.shared.users[0].id,
                    subject_id: SubjectRepositoryMock.shared.subjects[Int.random(in: 0..<SubjectRepositoryMock.shared.subjects.count)].id
            )

            grades.append(grade)
        }
    }

    func getSubjects(completion: @escaping ([Grade]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            completion(self.grades)
        }
    }
}
