import UIKit

final class StartViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupNavigation(isHidden: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(isHidden: true)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loginViewController = segue.destination as? LoginViewController {
            loginViewController.setupViewModel(with: LoginViewModel(delegate: loginViewController as LoginViewModelDelegate))
        }
        if let signUpViewController = segue.destination as? SignUpViewController {
            signUpViewController.setupViewModel(
                with: SignUpViewModel(
                    delegate: signUpViewController as SignUpViewModelDelegate))
        }
    }

    // MARK: - Private func
    private func setupButtons() {
        signUpButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(named: "Shamrock")?.cgColor
        loginButton.layer.cornerRadius = 15
    }
}
