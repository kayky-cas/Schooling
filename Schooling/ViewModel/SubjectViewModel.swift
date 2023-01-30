//
// Created by unicred on 18/01/23.
//

import Foundation

class SubjectViewModel {
    let gradeRepository = GradeRepositoryMock.shared
    let subjectRepository = SubjectRepositoryMock.shared

    func getUserSubjectAverageGrades(userId: UUID, completion: @escaping ([(Subject, [Grade])]) -> Void) {
        gradeRepository.getGrades { grades in
            self.subjectRepository.getSubjects { subjects in

                let grades = subjects.map { subject in
                    let subGrades = grades.filter {
                        $0.subjectId == subject.id && $0.userId == userId
                    }

                    return (subject, subGrades)
                }

                completion(grades)
            }
        }
    }
}
