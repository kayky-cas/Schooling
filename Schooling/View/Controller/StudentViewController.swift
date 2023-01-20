//
// Created by unicred on 18/01/23.
//

import UIKit

class StudentViewController: BaseViewController {
    let studentViewModel = StudentViewModel()
    let authProvider = AuthProvider.shared

    let subjectTableView = SubjectTableView()

    var students: [(User, [Grade])] = []

    var subjectName: String = ""

    override func loadView() {
        super.loadView()

        view = subjectTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        let alert = LoadingAlert(title: nil, message: "Carregando...", preferredStyle: .alert)
        present(alert, animated: true)

        studentViewModel.getSubjectAverageGrades(subjectId: authProvider.getUser()!.subject_id!) {
            self.students = $0.sorted { tuple, tuple2 in
                tuple.0.name > tuple2.0.name
            }

            self.studentViewModel.getSubjectById(subjectId: self.authProvider.getUser()!.subject_id!) {
                if let subject = $0 {
                    self.subjectName = subject.name
                }

                self.subjectTableView.reloadData()

                alert.dismiss(animated: true)
            }
        }
    }

    func setupTableView() {
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.register(TextNumberTableViewCell.self, forCellReuseIdentifier: subjectTableView.cellId)
    }
}

extension StudentViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SubjectHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        headerView.subjectLabel.text = "Aluno"


        headerView.averageGradesLabel.text = "Média em \(subjectName)"

        headerView.setupConstraints()

        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: subjectTableView.cellId, for: indexPath) as! TextNumberTableViewCell

        let (student, grades) = students[indexPath.item]

        var average = 0.0

        grades.forEach {
            average += $0.value
        }

        average = grades.count != 0 ? average / Double(grades.count) : 0

        cell.setup(name: student.name, average: average)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gradeViewController = GradeViewController()

        let (user, grades) = students[indexPath.item]

        gradeViewController.setContent(subject: user.name, grades: grades, userId: user.id)

        gradeViewController.updateTable = {
            self.studentViewModel.getSubjectAverageGrades(subjectId: self.authProvider.getUser()!.subject_id!) {
                self.students = $0.sorted { tuple, tuple2 in
                    tuple.0.name > tuple2.0.name
                }

                self.studentViewModel.getSubjectById(subjectId: self.authProvider.getUser()!.subject_id!) {
                    if let subject = $0 {
                        self.subjectName = subject.name
                    }

                    self.subjectTableView.reloadData()
                }
            }
        }

        if let presentationController = gradeViewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
        }

        present(gradeViewController, animated: true)
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        10.0
    }
}