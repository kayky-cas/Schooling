//
// Created by unicred on 19/01/23.
//

import UIKit

class ApproveViewController: BaseViewController {
    let approveViewModel = ApproveViewModel()

    let approveScreenView = ApproveTableView()

    var usersAndSchools: [(User, School)] = []

    override func loadView() {
        super.loadView()

        view = approveScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        updateTable()
    }

    func setupTableView() {
        approveScreenView.delegate = self
        approveScreenView.dataSource = self
        approveScreenView.register(ApproveTableViewCell.self, forCellReuseIdentifier: approveScreenView.cellId)
    }

    func updateTable() {
        let alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)
        present(alert, animated: true)

        approveViewModel.getClosedAccounts {
            self.usersAndSchools = $0
            self.approveScreenView.reloadData()
            alert.dismiss(animated: true)
        }
    }
}

extension ApproveViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SubjectHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        headerView.subjectLabel.text = "Conta"
        headerView.averageGradesLabel.text = "Escola"

        headerView.setupConstraints()

        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersAndSchools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: approveScreenView.cellId, for: indexPath) as! ApproveTableViewCell

        let (user, school) = usersAndSchools[indexPath.item]

        var role = ""

        switch user.role {
        case .student:
            role = "aluno"
        case .admin:
            role = "administrador"
        case .teacher:
            role = "professor"
        }

        cell.setup(name: user.name, role: role, domain: school.domain)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (user, school) = usersAndSchools[indexPath.item]

        let message = "Aprovar o aluno \(user.name) (\(user.cpf)) na \(school.name)"

        var role = ""

        switch user.role {
        case .student:
            role = "Aluno"
        case .admin:
            role = "Administrador"
        case .teacher:
            role = "Professor"
        }

        let approveAlert = UIAlertController(title: "Aprovar \(role)", message: message, preferredStyle: UIAlertController.Style.alert)

        approveAlert.addAction(UIAlertAction(title: "Aprovar", style: .default, handler: { (action: UIAlertAction!) in
            self.approveViewModel.approveUser(userId: user.id) {
                self.updateTable()
            }
        }))

        approveAlert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: { (action: UIAlertAction!) in
        }))

        present(approveAlert, animated: true, completion: nil)
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        10.0
    }
}