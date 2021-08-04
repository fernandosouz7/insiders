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
            loginViewController.create(with: LoginViewModel(delegate: loginViewController as LoginViewModelDelegate))
        }
    }

    // MARK: - Private func
    private func setupButtons() {
        signUpButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(red: 62.0/255, green: 213.0/255, blue: 151.0/255, alpha: 1.0).cgColor
        loginButton.layer.cornerRadius = 15
    }
}
