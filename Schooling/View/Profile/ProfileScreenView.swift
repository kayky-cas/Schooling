//
// Created by unicred on 17/01/23.
//

import UIKit

class ProfileScreenView: BaseScreenView {
    var logout: () -> Void = {
    }

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

    lazy var logoutButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Sair", for: .normal)
        uiButton.tintColor = .red

        uiButton.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)

        return uiButton
    }()

    override func setup() {
        addSubviews(
                nameLabel,
                roleLabel,
                cpfLabel,
                logoutButton
        )
    }

    override func setupConstraints() {
        nameLabel.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 30, left: 20, bottom: 0, right: 20)
        )

        roleLabel.anchor(
                top: nameLabel.bottomAnchor,
                leading: nameLabel.leadingAnchor
        )

        cpfLabel.anchor(
                top: nameLabel.bottomAnchor,
                trailing: nameLabel.trailingAnchor
        )

        logoutButton.anchor(
                bottom: safeAreaLayoutGuide.bottomAnchor,
                padding: .init(top: 0, left: 0, bottom: 20, right: 0),
                size: .init(width: 120, height: 0)
        )

        logoutButton.anchorCenterX(to: centerXAnchor)
    }

    @objc func touchUpInside() {
        logout()
    }
}
