import UIKit
import Cartography

final class StartView: UIView {

    private var stackView: UIStackView = UIStackView(frame: .zero)
    private var imageStack: UIStackView = UIStackView(frame: .zero)
    private var logoImage: UIImageView = UIImageView(frame: .zero)
    private var thumbnailImage: UIImageView = UIImageView(frame: .zero)
    private var signUpLabel: UILabel = UILabel(frame: .zero)
    private var signUpButton: UIButton = UIButton(frame: .zero)
    private var loginLabel: UILabel = UILabel(frame: .zero)
    private var loginButton: UIButton = UIButton(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildHierarchy() {
        stackView.addArrangedSubview(signUpLabel)
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(loginLabel)
        stackView.addArrangedSubview(loginButton)
        imageStack.addArrangedSubview(logoImage)
        imageStack.addArrangedSubview(thumbnailImage)
        addSubview(stackView)
        addSubview(imageStack)
    }

    private func setupConstraints() {
        constrain(stackView,
                  imageStack,
                  logoImage,
                  thumbnailImage,
                  signUpButton,
                  loginButton ) { stack, image, logo, thumbnail, signUpButton, loginButton  in
            stack.bottom == stack.superview!.safeAreaLayoutGuide.bottom - 45
            stack.leading == stack.superview!.leading + 32
            stack.trailing == stack.superview!.trailing - 32
            image.top == image.superview!.safeAreaLayoutGuide.top + 100
            image.leading == image.superview!.leading + 32
            image.trailing == image.superview!.trailing - 32
            logo.height == 190
            thumbnail.height == 75
            loginButton.height == 45
            signUpButton.height == 45
        }
    }

    private func configureViews() {
        imageStack.axis = .vertical
        imageStack.alignment = .fill
        imageStack.spacing = 70
        imageStack.translatesAutoresizingMaskIntoConstraints = false

        logoImage.image = UIImage(named: "LogoInsider")
        logoImage.contentMode = .scaleAspectFit

        thumbnailImage.image = UIImage(named: "thumbnail_insiders")
        thumbnailImage.contentMode = .scaleAspectFit

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false

        signUpLabel.text = "É sua primeira vez?"
        signUpLabel.textAlignment = .left
        signUpLabel.font = .boldSystemFont(ofSize: 17)

        signUpButton.setTitle("Inscrever-se", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.configuration = .filled()
        signUpButton.configuration?.cornerStyle = .capsule
        signUpButton.configuration?.buttonSize = .large
        signUpButton.configuration?.baseBackgroundColor = .init(named: "Shamrock")

        loginLabel.text = "Já tem uma conta?"
        loginLabel.textAlignment = .left
        loginLabel.font = .boldSystemFont(ofSize: 17)

        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(UIColor(named: "Shamrock"), for: .normal)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(named: "Shamrock")?.cgColor
        loginButton.layer.cornerRadius = 20

        backgroundColor = .systemBackground
    }

    private func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
