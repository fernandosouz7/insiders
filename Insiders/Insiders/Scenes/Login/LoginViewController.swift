import UIKit

final class LoginViewController: BaseViewController {

    private var viewModel: LoginViewModel?
    private var customView: LoginViewDelegate? {
        return (view as? LoginViewDelegate)
    }

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButton(selector: #selector(didTapBackButton))
        setupNavigation(isHidden: false)
        setupActions()
    }

    private func setupActions() {
        customView?.configureActions(forgotPasswordSelector: #selector(didTapButton(sender:)),
                                     loginSelector: #selector(didTapButton(sender:)),
                                     signUpSelector: #selector(didTapButton(sender:)),
                                     showHideSelector: #selector(didTapShowHideButton(sender:)),
                                     viewController: self)
    }

    private func setupLogin() {
        guard let loginViewModel = viewModel,
              let view = customView else {return}
        view.getEmailAndPassword {email, password in
            view.setupActivityIndicator()
            loginViewModel.makeLogin(with: email, and: password) {[weak self] _ in
                self?.customView?.setupActivityIndicator()
            }
        }
    }

    @objc private func didTapButton(sender: UIButton) {
        guard let placeholder = sender.titleLabel?.text else {return}
        switch placeholder {
        case "Esqueceu a senha?": viewModel?.showRecoverPasswordViewController()
        case "Entrar": self.setupLogin()
        case "Inscrever-se": viewModel?.showSignUpViewController()
        default:
            break
        }
    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }

    @objc private func didTapShowHideButton(sender: UIButton) {
        customView?.setupShowHideButton()
    }
}
