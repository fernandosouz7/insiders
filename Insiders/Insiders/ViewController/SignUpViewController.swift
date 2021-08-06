import UIKit

final class SignUpViewController: UIViewController {
    private var viewModel: SignUpViewModel?
    @IBOutlet private weak var fullNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: false)
        setupSignUpButton()
    }
    @IBAction func didTapSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        viewModel?.createUser(with: email, and: password)
    }
    private func setupSignUpButton() {
        signUpButton.layer.cornerRadius = 15
    }
    func create(with viewModel: SignUpViewModel) {
        self.viewModel = viewModel
    }
}

extension SignUpViewController: SignUpViewModelDelegate {
    func showErrorMessage(with message: String) {
        presentAlert(with: message)
    }
}
