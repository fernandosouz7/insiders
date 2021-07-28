import UIKit

class LoginViewController: UIViewController {
    // MARK: - Stored Properties
    private var loginViewModel: LoginViewModel!
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    //MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLoginButton()
        bindData()
    }
    
    //MARK: - IBActions
    @IBAction func didTapLoginButton(_ sender: Any) {
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
            self.present(alert, animated: true, completion: nil)
        }
        
        loginViewModel.loginResult.bind { [weak self] in
            if $0 { self?.performSegue(withIdentifier: "loginToHome", sender: self)}
        }
    }
}

extension LoginViewController {
    
    func create(with viewModel: LoginViewModel) {
        loginViewModel = viewModel
    }
}


