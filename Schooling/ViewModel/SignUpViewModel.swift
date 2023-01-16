//
// Created by unicred on 16/01/23.
//

import Foundation

class SignUpViewModel {
    let schoolRepository = SchoolRepositoryMock.shared

    func getSchoolsName(completion: @escaping ([String]) -> Void) {
        schoolRepository.getSchools { schools in
            completion(schools.map {
                $0.name
            })
        }
    }
}
