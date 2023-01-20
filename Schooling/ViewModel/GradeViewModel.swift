//
// Created by unicred on 19/01/23.
//

import Foundation

class GradeViewModel {
    let gradeRepository = GradeRepositoryMock.shared

    func addGrade(grade: Grade, completion: @escaping () -> Void) {
        gradeRepository.addGrades(grade: grade, completion: completion)
    }
}
