import UIKit

final class SignUpViewController: UIViewController {

    // MARK: - Private Properties
    private var viewModel: SignUpViewModel?

    // MARK: - IBOutlets
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

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: false)
        setupSignUpButtonAndFullNameTextField()
        setupGestureReconizer()
    }

    // MARK: - IBActions
    @IBAction private func didTapSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        viewModel?.createUser(with: email, and: password)
    }

    // MARK: - Private func
    private func setupSignUpButtonAndFullNameTextField() {
        signUpButton.layer.cornerRadius = 15
        disableSignUpButton()
        fullNameTextField.becomeFirstResponder()
    }

    private func enableSignUpButton() {
        if isErrorLabelHidden() &&
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

    private func isErrorLabelHidden() -> Bool {
        fullNameErrorLabel.isHidden && emailErrorLabel.isHidden && passwordErrorLabel.isHidden
    }

    private func setupGestureReconizer() {
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGestureReconizer)
    }

    @objc private func didTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    // MARK: - Public functions
    func setupViewModel(with viewModel: SignUpViewModel) {
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
