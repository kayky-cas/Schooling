//
// Created by unicred on 18/01/23.
//

import Foundation

class ProfileViewModel {
    let subjectRepository = SubjectRepositoryMock.shared

    func getTeacherSubject(subjectId: UUID, completion: @escaping (Subject?) -> Void) {
        subjectRepository.getSubjects {
            completion($0.first {
                $0.id == subjectId
            })
        }
    }
}
