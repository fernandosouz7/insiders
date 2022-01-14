import UIKit

final class LoginViewController: BaseViewController {

    private var viewModel: LoginViewModel?

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
    }

    // MARK: - IBActions
//    @IBAction private func didTapLoginButton(_ sender: Any) {
//        guard let email = emailField.text,
//              let password = passwordField.text,
//              let loginViewModel = viewModel else { return }
//        activityIndicator.startAnimating()
//        loginViewModel.makeLogin(with: email, and: password)
//    }
//
//    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
//        viewModel?.showRecoverPasswordViewController()
//    }
//
//    @IBAction func didTapSignUpButton(_ sender: Any) {
//        viewModel?.showSignUpViewController()
//    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }
}

//extension LoginViewController: LoginViewModelDelegate {
//
//    func showErrorMessage(with message: String) {
//        activityIndicator.stopAnimating()
//        presentAlert(with: message)
//    }
//
//    func didFinishLoginWithSuccess() {
//        activityIndicator.stopAnimating()
//    }
//}
