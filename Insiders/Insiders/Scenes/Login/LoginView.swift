import UIKit
import Cartography

protocol LoginViewDelegate: AnyObject {
    func configureActions(forgotPasswordSelector: Selector,
                          loginSelector: Selector,
                          signUpSelector: Selector,
                          showHideSelector: Selector,
                          viewController: UIViewController)
    func getEmailAndPassword(completion: @escaping (String, String) -> Void)
    func showActivityIndicator()
    func stopActivityIndicator()
    func showButton()
    func hideButton()
}

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
    private var showHideButton: UIButton = UIButton(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildHierarchy() {
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordStack)
        passwordStack.addArrangedSubview(passwordField)
        passwordStack.addArrangedSubview(forgotPasswordButton)
        stackView.addArrangedSubview(loginButton)
        signUpStack.addArrangedSubview(signUpLabel)
        signUpStack.addArrangedSubview(signUpButton)
        addSubview(imageView)
        addSubview(stackView)
        addSubview(signUpStack)
        addSubview(showHideButton)
    }

    private func setupConstraints() {
        constrain(stackView,
                  imageView,
                  signUpStack,
                  emailField,
                  passwordField,
                  forgotPasswordButton,
                  showHideButton) { stack, image, signUp, email, password, forgot, show in
            image.top == image.superview!.safeAreaLayoutGuide.top + 30
            image.leading == image.superview!.leading + 32
            image.trailing == image.superview!.trailing - 32
            stack.centerY == stack.superview!.centerY
            stack.leading == stack.superview!.leading + 32
            stack.trailing == stack.superview!.trailing - 32
            forgot.left == stack.left + 255
            signUp.top == stack.bottom + 16
            signUp.centerX == signUp.superview!.centerX
            show.centerY == password.centerY
            show.right == password.rightMargin
            show.height == 24
            show.width == 24
            image.height == 75
            email.height == 50
            password.height == 50
            password.width == stack.width
        }
    }

    private func configureViews() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 30

        imageView.image = UIImage(named: "thumbnail_insiders")

        emailField.placeholder = "Email"
        emailField.keyboardType = .emailAddress
        emailField.textContentType = .emailAddress
        emailField.borderStyle = .roundedRect

        passwordStack.axis = .vertical
        passwordStack.alignment = .fill
        passwordStack.distribution = .fill
        passwordStack.spacing = 10

        passwordField.placeholder = "Senha"
        passwordField.textContentType = .password
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .roundedRect

        showHideButton.setImage(UIImage(named: "open-eye"), for: .normal)

        forgotPasswordButton.setTitle("Esqueceu a senha?", for: .normal)
        forgotPasswordButton.contentHorizontalAlignment = .trailing
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 12)
        forgotPasswordButton.setTitleColor(UIColor(named: "Shamrock"), for: .normal)

        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.configuration = .filled()
        loginButton.configuration?.cornerStyle = .capsule
        loginButton.configuration?.buttonSize = .large
        loginButton.configuration?.baseBackgroundColor = .init(named: "Shamrock")

        signUpStack.axis = .horizontal
        signUpStack.alignment = .fill
        signUpStack.distribution = .fillProportionally
        signUpStack.spacing = 4

        signUpLabel.text = "Não tem conta?"
        signUpLabel.textAlignment = .right
        signUpLabel.font = .systemFont(ofSize: 12)

        signUpButton.titleLabel?.font = .systemFont(ofSize: 12)
        signUpButton.contentHorizontalAlignment = .leading
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

extension LoginView: LoginViewDelegate {
    func configureActions(forgotPasswordSelector: Selector,
                          loginSelector: Selector,
                          signUpSelector: Selector,
                          showHideSelector: Selector,
                          viewController: UIViewController) {
        forgotPasswordButton.addTarget(viewController, action: forgotPasswordSelector, for: .touchUpInside)
        loginButton.addTarget(viewController, action: loginSelector, for: .touchUpInside)
        signUpButton.addTarget(viewController, action: signUpSelector, for: .touchUpInside)
        showHideButton.addTarget(viewController, action: showHideSelector, for: .touchUpInside)
    }

    func getEmailAndPassword(completion: @escaping (String, String) -> Void) {
        guard let email = emailField.text,
              let password = passwordField.text else { return }
        completion(email, password)
    }

    func showActivityIndicator() {
        loginButton.configuration?.showsActivityIndicator = true
        loginButton.setTitle("", for: .normal)
    }

    func stopActivityIndicator() {
        loginButton.configuration?.showsActivityIndicator = false
        loginButton.setTitle("Entrar", for: .normal)
    }

    func showButton() {
        passwordField.isSecureTextEntry = true
        showHideButton.setImage(UIImage(named: "open-eye"), for: .normal)
    }

    func hideButton() {
        passwordField.isSecureTextEntry = false
        showHideButton.setImage(UIImage(named: "closed-eye"), for: .normal)
    }
}
