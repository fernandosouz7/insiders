import UIKit

final class LoginViewController: UIViewController {
    // MARK: - Stored Properties
    private var loginViewModel: LoginViewModel?
    
    //MARK: - IBOutlets
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    
    //MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLoginButton()
        bindData()
    }
    
    //MARK: - IBActions
    @IBAction private func didTapLoginButton(_ sender: Any) {
        activityIndicator.startAnimating()
        guard let email = emailField.text, let password = passwordField.text else { return }
        loginViewModel.updateCredentials(with: email, and: password)
        
        switch loginViewModel.credentialsInput() {
        case .Correct:
            login()
        case .Incorrect:
            return
        }
    }
    
}

//MARK: - Private func
extension LoginViewController {
    
    private func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupLoginButton() {
        loginButton.layer.cornerRadius = 15
    }
    
    private func login() {
        loginViewModel.login()
    }
    
    private func bindData() {
        loginViewModel.errorMessage.bind {
            guard let errorMessage = $0 else { return }
            let alert = UIAlertController(title: errorMessage, message: nil , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.activityIndicator.stopAnimating()
            self.present(alert, animated: true, completion: nil)
        }
        
        loginViewModel.loginResult.bind { [weak self] in
            if $0 {
                self?.activityIndicator.stopAnimating()
                self?.performSegue(withIdentifier: "loginToHome", sender: self)}
        }
    }
}

extension LoginViewController {
    
    func create(with viewModel: LoginViewModel) {
        loginViewModel = viewModel
    }
}
