import UIKit
import Cartography

final class LoginView: UIView {

    private var stackView: UIStackView = UIStackView(frame: .zero)
    private var signUpStack: UIStackView = UIStackView(frame: .zero)
    private var passwordStack: UIStackView = UIStackView(frame: .zero)
    private var imageView: UIImageView = UIImageView(frame: .zero)
    private var emailField: UITextField = UITextField(frame: .zero)
    private var passwordField: UITextField = UITextField(frame: .zero)
    private var signUpLabel: UILabel = UILabel(frame: .zero)
    private var signUpButton: UIButton = UIButton(frame: .zero)
    private var loginButton: UIButton = UIButton(frame: .zero)
    private var forgotPasswordButton: UIButton = UIButton(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildHierarchy() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordStack)
        passwordStack.addArrangedSubview(passwordField)
        passwordStack.addArrangedSubview(forgotPasswordButton)
        stackView.addArrangedSubview(loginButton)
        signUpStack.addArrangedSubview(signUpLabel)
        signUpStack.addArrangedSubview(signUpButton)
        addSubview(stackView)
        addSubview(signUpStack)
    }

    private func setupConstraints() {
        constrain(stackView,
                  imageView,
                  signUpStack,
                  emailField,
                  passwordField) { stack, image, signUp, email, password in
            stack.top == stack.superview!.safeAreaLayoutGuide.top + 16
            stack.leading == stack.superview!.leading + 32
            stack.trailing == stack.superview!.trailing - 32
            signUp.leading == stack.leading
            signUp.trailing == stack.trailing
            signUp.bottom == stack.superview!.safeAreaLayoutGuide.bottom - 16
            image.height == 75
            email.height == 50
            password.height == 50
        }
    }

    private func configureViews() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage(named: "thumbnail_insiders")

        emailField.placeholder = "Email"
        emailField.keyboardType = .emailAddress
        emailField.textContentType = .emailAddress
        emailField.borderStyle = .roundedRect

        passwordStack.axis = .vertical
        passwordStack.alignment = .fill
        passwordStack.distribution = .fill
        passwordStack.spacing = 16

        passwordField.placeholder = "Senha"
        passwordField.textContentType = .password
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .roundedRect

        forgotPasswordButton.setTitle("Esqueceu a senha?", for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 12)
        forgotPasswordButton.setTitleColor(UIColor(named: "Shamrock"), for: .normal)

        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(UIColor(named: "Shamrock"), for: .normal)
        loginButton.backgroundColor = UIColor(named: "Shamrock")
//        loginButton.configuration?.cornerStyle = .capsule
//        loginButton.configuration?.buttonSize = .large
//        loginButton.configuration?.baseBackgroundColor = .init(named: "Shamrock")

        signUpStack.axis = .horizontal
        signUpStack.alignment = .fill
        signUpStack.distribution = .fillEqually

        signUpLabel.text = "Não tem conta?"
        signUpLabel.textAlignment = .right
        signUpLabel.font = .systemFont(ofSize: 12)

        signUpButton.titleLabel?.font = .systemFont(ofSize: 12)
        signUpButton.setTitle("Inscrever-se", for: .normal)
        signUpButton.setTitleColor(UIColor(named: "Shamrock"), for: .normal)

        backgroundColor = .systemBackground
    }

    private func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
