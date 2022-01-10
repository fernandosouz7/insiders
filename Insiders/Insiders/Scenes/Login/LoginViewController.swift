import UIKit

final class LoginViewController: BaseViewController {

    // MARK: - Private Properties
    private var viewModel: LoginViewModel? 

//    // MARK: - IBOutlets
//    @IBOutlet private weak var emailField: UITextField!
//    @IBOutlet private weak var passwordField: UITextField!
//    @IBOutlet private weak var loginButton: UIButton!
//    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

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
//        super.setupLeftBarButton(selector: #selector(didTapBackButton))
        setupNavigation(isHidden: false)
//        setupLoginButton()
        title = "Entrar"
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

    // MARK: - Public functions
    func setup(with viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private func
//    private func setupLoginButton() {
//        loginButton.layer.cornerRadius = 15
//    }

//    @objc private func didTapBackButton() {
//        viewModel?.didFinish()
//    }
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
