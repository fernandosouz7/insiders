import UIKit

final class SignUpViewController: UIViewController {

    private var viewModel: SignUpViewModel?

    @IBOutlet private weak var fullNameTextField: UITextField! {
        didSet { fullNameTextField.delegate = self }}
    @IBOutlet private weak var emailTextField: UITextField! {
        didSet { emailTextField.delegate = self }}
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet { passwordTextField.delegate = self }}
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var fullNameErrorLabel: UILabel!
    @IBOutlet private weak var emailErrorLabel: UILabel!
    @IBOutlet private weak var passwordErrorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: false)
        setupSignUpButton()
        fullNameTextField.becomeFirstResponder()
        setupGestureReconizer()
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        viewModel?.createUser(with: email, and: password)
    }

    @IBAction func didTapLoginButton(_ sender: Any) {

    }

    private func setupSignUpButton() {
        signUpButton.layer.cornerRadius = 15
        disableSignUpButton()
    }

    private func enableSignUpButton() {
        if errorLabelIsHidden() &&
            !(passwordTextField.text?.isEmpty ?? true) &&
            !(emailTextField.text?.isEmpty ?? true) {
            signUpButton.isHighlighted = false
            signUpButton.isEnabled = true
            signUpButton.layer.backgroundColor = UIColor(named: "Shamrock")?.cgColor
        } else { disableSignUpButton() }
    }

    private func disableSignUpButton() {
        signUpButton.isHighlighted = true
        signUpButton.isEnabled = false
        signUpButton.layer.backgroundColor = UIColor.systemGray6.cgColor
    }

    private func errorLabelIsHidden() -> Bool {
        if fullNameErrorLabel.isHidden &&
            emailErrorLabel.isHidden &&
            passwordErrorLabel.isHidden {
            return true
        }
        return false
    }

    private func setupGestureReconizer() {
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        view.addGestureRecognizer(tapGestureReconizer)
    }

    @objc private func didTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    func create(with viewModel: SignUpViewModel) {
        self.viewModel = viewModel
    }
}

extension SignUpViewController: SignUpViewModelDelegate {

    func showEmailErrorMessage(with message: String) {
        emailErrorLabel.isHidden = false
        emailErrorLabel.text = message
    }

    func showPasswordErrorMessage(with message: String) {
        passwordErrorLabel.isHidden = false
        passwordErrorLabel.text = message
    }

    func showFullNameErrorMessage(with message: String) {
        fullNameErrorLabel.isHidden = false
        fullNameErrorLabel.text = message
    }

    func didFinishSignUpWithSuccess() {
        performSegue(withIdentifier: "signUpToHome", sender: self)
    }

    func showErrorMessage(with message: String) {
        presentAlert(with: message)
    }
}

extension SignUpViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField {
        case fullNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            if signUpButton.isEnabled {
                didTapSignUpButton(self)
            }
        default: break
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = textField.text else { return }
        switch textField {
        case fullNameTextField:
            viewModel?.validateFullName(with: value)
        case emailTextField:
            viewModel?.validateEmail(with: value)
        case passwordTextField:
            viewModel?.validatePassword(with: value)
        default: break
        }
        enableSignUpButton()
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case fullNameTextField:
            fullNameErrorLabel.isHidden = true
        case emailTextField:
            emailErrorLabel.isHidden = true
        case passwordTextField:
            passwordErrorLabel.isHidden = true
        default: break
        }
        enableSignUpButton()
    }
}
