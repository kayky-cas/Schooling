//
// Created by unicred on 20/01/23.
//

import Foundation

class SchoolViewModel {
    let schoolRepository = SchoolRepositoryMock.shared

    func getSchools(completion: @escaping ([School]) -> Void) {
        schoolRepository.getSchools { schools in
            completion(schools)
        }
    }

    func addSchools(school: School, completion: @escaping () -> Void) {
        schoolRepository.addSchools(school: school, completion: completion)
    }
}
