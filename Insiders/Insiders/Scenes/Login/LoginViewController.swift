import UIKit

final class LoginViewController: BaseViewController {

    private var viewModel: LoginViewModel?
    private var customView: LoginViewDelegate? {
        return (view as? LoginViewDelegate)
    }
    private var passwordVisible: Bool = true

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
        customView?.configureActions(forgotPasswordSelector: #selector(didTapForgotPasswordButton(sender:)),
                                     loginSelector: #selector(didTapLoginButton(sender:)),
                                     signUpSelector: #selector(didTapSignUpButton(sender:)),
                                     showHideSelector: #selector(didTapShowHideButton(sender:)),
                                     viewController: self)
    }

    @objc func didTapLoginButton(sender: UIButton) {
        guard let loginViewModel = viewModel,
              let view = customView else {return}
        view.getEmailAndPassword {email, password in
            view.showActivityIndicator()
            loginViewModel.makeLogin(with: email, and: password) {[weak self] _ in
                self?.customView?.stopActivityIndicator()
            }
        }
    }

    @objc func didTapForgotPasswordButton(sender: UIButton) {
        viewModel?.showRecoverPasswordViewController()
    }

    @objc func didTapSignUpButton(sender: UIButton) {
        viewModel?.showSignUpViewController()
    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }

    @objc private func didTapShowHideButton(sender: UIButton) {
        if passwordVisible {
            customView?.hideButton()
            passwordVisible = false
        } else {
            customView?.showButton()
            passwordVisible = true
        }
    }
}
