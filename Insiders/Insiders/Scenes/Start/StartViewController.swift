import UIKit

final class StartViewController: UIViewController, Storyboardable {

    var coordinator: StartCooordinator?
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

    @IBAction func didTapSignUpButton(_ sender: Any) {
        coordinator?.pushSignUpViewController()
    }
    @IBAction func didTapLoginButton(_ sender: Any) {
        coordinator?.pushLoginViewController()
    }
    // MARK: - Private func
    private func setupButtons() {
        signUpButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(named: "Shamrock")?.cgColor
        loginButton.layer.cornerRadius = 15
    }
}
