//
// Created by unicred on 16/01/23.
//

import Foundation

class SignUpViewModel {
    let userRepository = UserRepositoryMock.shared
    let schoolRepository = SchoolRepositoryMock.shared
    let subjectRepository = SubjectRepositoryMock.shared

    func getSchoolsAndSubjects(completion: @escaping ([School], [Subject]) -> Void) {
        schoolRepository.getSchools { schools in
            self.subjectRepository.getSubjects { subjects in
                completion(schools, subjects)
            }
        }
    }

    func addUser(user: User, completion: @escaping () -> Void) {
        userRepository.addUser(user: user, completion: completion)
    }
}
