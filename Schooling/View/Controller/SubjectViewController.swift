//
// Created by unicred on 18/01/23.
//

import UIKit

class SubjectViewController: BaseViewController {
    let subjectViewModel = SubjectViewModel()
    let authProvider = AuthProvider.shared

    let subjectTableView = SubjectTableView()

    var subjects: [(Subject, [Grade])] = []

    override func loadView() {
        super.loadView()

        view = subjectTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        let alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)
        present(alert, animated: true)

        subjectViewModel.getUserSubjectAverageGrades(userId: authProvider.getUser()!.id) {
            self.subjects = $0
            self.subjectTableView.reloadData()

            alert.dismiss(animated: true)
        }
    }

    func setupTableView() {
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.register(TextNumberTableViewCell.self, forCellReuseIdentifier: subjectTableView.cellId)
    }
}

extension SubjectViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SubjectHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        headerView.setupConstraints()

        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: subjectTableView.cellId, for: indexPath) as! TextNumberTableViewCell

        let (subject, grades) = subjects[indexPath.item]

        var average = 0.0

        grades.forEach {
            average += $0.value
        }

        average = grades.count != 0 ? (average / Double(grades.count)) : 0.0

        cell.setup(name: subject.name, average: average)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gradeViewController = GradeViewController()

        let (subject, grades) = subjects[indexPath.item]

        gradeViewController.setContent(subject: subject, grades: grades)

        if let presentationController = gradeViewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
        }

        present(gradeViewController, animated: true)
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        10.0
    }
}