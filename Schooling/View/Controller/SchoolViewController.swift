//
// Created by unicred on 20/01/23.
//

import UIKit

class SchoolViewController: BaseViewController {
    let schoolViewModel = SchoolViewModel()

    let schoolScreenView = SchoolScreenView()

    lazy var alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)

    var schools: [School] = []

    override func loadView() {
        super.loadView()

        view = schoolScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        schoolScreenView.createSchool = createSchool

        setupTableView()

        present(alert, animated: true)

        schoolViewModel.getSchools {
            self.schools = $0
            self.schoolScreenView.schoolTableView.reloadData()
            self.alert.dismiss(animated: true)
        }
    }

    func setupTableView() {
        schoolScreenView.schoolTableView.delegate = self
        schoolScreenView.schoolTableView.dataSource = self
        schoolScreenView.schoolTableView.register(SchoolTableViewCell.self, forCellReuseIdentifier: schoolScreenView.schoolTableView.cellId)
    }

    func createSchool(school: School) {
        present(alert, animated: true)

        schoolViewModel.addSchools(school: school) {
            self.schools.append(school)
            self.schoolScreenView.schoolTableView.reloadData()
            self.alert.dismiss(animated: true)
        }
    }
}

extension SchoolViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SubjectHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        headerView.subjectLabel.text = "Escola"

        headerView.averageGradesLabel.text = "Dominio"

        headerView.setupConstraints()

        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: schoolScreenView.schoolTableView.cellId, for: indexPath) as! SchoolTableViewCell

        let school = schools[indexPath.item]

        cell.setup(name: school.name, domain: school.domain)

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            schools.remove(at: indexPath.item)

            schoolScreenView.schoolTableView.deleteRows(at: [indexPath], with: .automatic)

            schoolViewModel.delete(at: indexPath.item) {
            }
        }
    }
}
