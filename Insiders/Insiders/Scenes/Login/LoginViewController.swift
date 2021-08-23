import UIKit

final class LoginViewController: BaseViewController, Storyboardable {

    // MARK: - Private Properties
    private var viewModel: LoginViewModel? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButton(selector: #selector(didTapBackButton))
        setupNavigation(isHidden: false)
        setupLoginButton()
    }

    // MARK: - IBActions
    @IBAction private func didTapLoginButton(_ sender: Any) {
        guard let email = emailField.text,
              let password = passwordField.text,
              let loginViewModel = viewModel else { return }
        activityIndicator.startAnimating()
        loginViewModel.makeLogin(with: email, and: password)
    }

    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
        viewModel?.showRecoverPasswordViewController()
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
        viewModel?.showSignUpViewController()
    }

    // MARK: - Public functions
    func setup(with viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private func
    private func setupLoginButton() {
        loginButton.layer.cornerRadius = 15
    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }
}

extension LoginViewController: LoginViewModelViewDelegate {

    func showErrorMessage(with message: String) {
        activityIndicator.stopAnimating()
        presentAlert(with: message)
    }

    func didFinishLoginWithSuccess() {
        activityIndicator.stopAnimating()
//        performSegue(withIdentifier: "loginToHome", sender: self)
    }
}
