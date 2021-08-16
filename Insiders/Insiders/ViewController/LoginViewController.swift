import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Private Properties
    private var loginViewModel: LoginViewModel?

    // MARK: - IBOutlets
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: false)
        setupLoginButton()
    }

    // MARK: - IBActions
    @IBAction private func didTapLoginButton(_ sender: Any) {
        guard let email = emailField.text,
              let password = passwordField.text,
              let loginViewModel = loginViewModel else { return }
        activityIndicator.startAnimating()
        loginViewModel.makeLogin(with: email, and: password)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recoverPasswordViewController = segue.destination as? RecoverPasswordViewController {
            recoverPasswordViewController.setupViewModel(
                with: RecoverPasswordViewModel(
                    delegate: recoverPasswordViewController as RecoverPasswordViewModelDelegate))
        }
    }
    // MARK: - Public functions
    func setupViewModel(with viewModel: LoginViewModel) {
        loginViewModel = viewModel
    }

    // MARK: - Private func
    private func setupLoginButton() {
        loginButton.layer.cornerRadius = 15
    }
}

extension LoginViewController: LoginViewModelDelegate {

    func showErrorMessage(with message: String) {
        activityIndicator.stopAnimating()
        presentAlert(with: message)
    }

    func didFinishLoginWithSuccess() {
        activityIndicator.stopAnimating()
        performSegue(withIdentifier: "loginToHome", sender: self)
    }
}
