//
// Created by unicred on 20/01/23.
//

import Foundation

class SchoolViewModel {
    let schoolRepository = SchoolRepositoryMock.shared

    func getSchoolsName(completion: @escaping ([String]) -> Void) {
        schoolRepository.getSchools { schools in
            completion(schools.map {
                $0.name
            })
        }
    }
}
