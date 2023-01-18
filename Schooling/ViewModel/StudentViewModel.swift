//
// Created by unicred on 18/01/23.
//

import Foundation

class StudentViewModel {
    let gradeRepository = GradeRepositoryMock.shared
    let userRepository = UserRepositoryMock.shared
    let subjectRepository = SubjectRepositoryMock.shared

    func getSubjectById(subjectId: UUID, completion: @escaping (Subject?) -> Void) {
        subjectRepository.getSubjects {
            completion($0.first(where: {
                $0.id == subjectId
            }))
        }
    }

    func getSubjectAverageGrades(subjectId: UUID, completion: @escaping ([(User, [Grade])]) -> Void) {
        gradeRepository.getSubjects { grades in

            self.userRepository.getUsers { users in

                let grades = users.filter {
                            $0.role == .student
                        }
                        .map { user in
                            let subGrades = grades.filter {
                                $0.user_id == user.id && $0.subject_id == subjectId
                            }

                            return (user, subGrades)
                        }

                completion(grades)
            }
        }
    }
}
