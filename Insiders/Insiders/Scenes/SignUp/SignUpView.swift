import UIKit
import Cartography

final class SignUpView: UIView {

    private var signUpStack: UIStackView = UIStackView(frame: .zero)
    private var loginStack: UIStackView = UIStackView(frame: .zero)
    private var fullNameField: UITextField = UITextField(frame: .zero)
    private var emailField: UITextField = UITextField(frame: .zero)
    private var passwordField: UITextField = UITextField(frame: .zero)
    private var signUpButton: UIButton = UIButton(frame: .zero)
    private var loginButton: UIButton = UIButton(frame: .zero)
    private var loginLabel: UILabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildHierarchy() {
        signUpStack.addArrangedSubview(fullNameField)
        signUpStack.addArrangedSubview(emailField)
        signUpStack.addArrangedSubview(passwordField)
        signUpStack.addArrangedSubview(signUpButton)
        loginStack.addArrangedSubview(loginLabel)
        loginStack.addArrangedSubview(loginButton)
        addSubview(signUpStack)
        addSubview(loginStack)
    }

    private func setupConstraints() {
        constrain(signUpStack,
                  loginStack,
                  fullNameField,
                  emailField,
                  passwordField) { signUp, login, fullName, email, password in
            signUp.top == signUp.superview!.safeAreaLayoutGuide.top + 16
            signUp.leading == signUp.superview!.leading + 32
            signUp.trailing == signUp.superview!.trailing - 32
            login.centerX == login.superview!.centerX
            login.bottom == login.superview!.safeAreaLayoutGuide.bottom - 16
            fullName.height == 50
            email.height == 50
            password.height == 50
        }
    }
    private func configureView() {
        signUpStack.axis = .vertical
        signUpStack.alignment = .fill
        signUpStack.distribution = .fill
        signUpStack.spacing = 30

        fullNameField.placeholder = "Nome Completo"
        fullNameField.keyboardType = .namePhonePad
        fullNameField.textContentType = .name
        fullNameField.borderStyle = .roundedRect

        emailField.placeholder = "Email"
        emailField.keyboardType = .emailAddress
        emailField.textContentType = .emailAddress
        emailField.borderStyle = .roundedRect

        passwordField.placeholder = "Senha"
        passwordField.textContentType = .password
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .roundedRect

        signUpButton.setTitle("Inscrever-se", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.configuration = .filled()
        signUpButton.configuration?.cornerStyle = .capsule
        signUpButton.configuration?.buttonSize = .large
        signUpButton.configuration?.baseBackgroundColor = .init(named: "Shamrock")

        loginStack.axis = .horizontal
        loginStack.alignment = .fill
        loginStack.distribution = .fillProportionally
        loginStack.spacing = 4

        loginLabel.text = "Já é um membro?"
        loginLabel.textAlignment = .right
        loginLabel.font = .systemFont(ofSize: 12)

        loginButton.titleLabel?.font = .systemFont(ofSize: 12)
        loginButton.contentHorizontalAlignment = .leading
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(UIColor(named: "Shamrock"), for: .normal)

        backgroundColor = .systemBackground
    }

    private func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureView()
    }
}
