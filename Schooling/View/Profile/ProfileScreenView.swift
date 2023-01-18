//
// Created by unicred on 17/01/23.
//

import UIKit

class ProfileScreenView: BaseScreenView {
    var user: User? {
        didSet {
            if let user = user {
                nameLabel.text = user.name
                cpfLabel.text = user.cpf

                switch user.role {
                case .teacher:
                    roleLabel.text = "Professor"
                case .admin:
                    roleLabel.text = "Administrador"
                case .student:
                    roleLabel.text = "Aluno"
                }
            }
        }
    }

    var subject: Subject? {
        didSet {
            if let user = user {
                if user.role != .teacher {
                    return
                }

                roleLabel.text = "Professor " + (subject?.name ?? "")
            }
        }
    }

    lazy var nameLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.font = .boldSystemFont(ofSize: 30)

        return uiLabel
    }()

    lazy var roleLabel: UILabel = {
        let uiLabel = UILabel()

        return uiLabel
    }()

    lazy var cpfLabel: UILabel = {
        let uiLabel = UILabel()

        return uiLabel
    }()

    override func setup() {
        addSubviews(
                nameLabel,
                roleLabel,
                cpfLabel
        )
    }

    override func setupConstraints() {
        nameLabel.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                padding: .init(top: 30, left: 0, bottom: 0, right: 0)
        )

        nameLabel.anchorCenterX(to: safeAreaLayoutGuide.centerXAnchor)

        roleLabel.anchor(
                top: nameLabel.bottomAnchor,
                leading: nameLabel.leadingAnchor
        )
        cpfLabel.anchor(
                top: nameLabel.bottomAnchor,
                trailing: nameLabel.trailingAnchor
        )
    }
}
