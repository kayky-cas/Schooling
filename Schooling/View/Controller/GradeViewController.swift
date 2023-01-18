//
// Created by unicred on 18/01/23.
//

import UIKit

class GradeViewController: BaseViewController {
    let gradeScreenView = GradeScreenView()

    var grades: [Grade] = []

    override func loadView() {
        super.loadView()

        view = gradeScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        gradeScreenView.gradeTableView.delegate = self
        gradeScreenView.gradeTableView.dataSource = self
        gradeScreenView.gradeTableView.register(TextNumberTableViewCell.self, forCellReuseIdentifier: gradeScreenView.gradeTableView.cellId)
    }

    func setContent(subject: Subject, grades: [Grade]) {
        gradeScreenView.subject = subject
        gradeScreenView.grades = grades


        self.grades = grades
        gradeScreenView.gradeTableView.reloadData()
    }
}

extension GradeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SubjectHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        headerView.subjectLabel.text = "Avaliação"
        headerView.averageGradesLabel.text = "Nota"
        headerView.setupConstraints()

        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        grades.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gradeScreenView.gradeTableView.cellId, for: indexPath) as! TextNumberTableViewCell

        let grade = grades[indexPath.item]

        cell.setup(name: grade.name, average: grade.value)

        return cell
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        10.0
    }
}