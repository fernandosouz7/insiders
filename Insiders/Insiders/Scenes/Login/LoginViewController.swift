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
        customView?.configureActions(buttonSelector: #selector(didTapButton(sender:)),
                                     viewController: self)
    }

    private func setupLogin() {
        guard let loginViewModel = viewModel,
              let view = customView else {return}
        view.getEmailAndPassword {email, password in
            view.showActivityIndicator()
            loginViewModel.makeLogin(with: email, and: password) {[weak self] _ in
                self?.customView?.showActivityIndicator()
            }
        }
    }

    @objc private func didTapButton(sender: UIButton) {
        let index = sender.tag
        switch index {
        case 0: customView?.setupPasswordVisibility()
        case 1: viewModel?.showRecoverPasswordViewController()
        case 2: self.setupLogin()
        case 3: viewModel?.showSignUpViewController()
        default:
            break
        }
    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }
}
