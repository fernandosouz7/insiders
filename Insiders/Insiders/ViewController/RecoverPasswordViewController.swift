import UIKit

final class RecoverPasswordViewController: UIViewController {
    // MARK: - Private Properties
    private var viewModel: RecoverPasswordViewModel?
    // MARK: - IBOutlets
    @IBOutlet private weak var sendButton: UIButton!
    @IBOutlet private weak var emailTextField: UITextField!
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSendButton()
    }
    // MARK: - IBActions
    @IBAction private func didTapSendButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let recoverPasswordViewModel = viewModel else { return }
        recoverPasswordViewModel.sendPasswordReset(with: email)
    }
    // MARK: - Public functions
    func create(with viewModel: RecoverPasswordViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - Private func
    private func setupSendButton() {
        sendButton.layer.cornerRadius = 15
    }
}
// MARK: - Recover Password View Model Delegate
extension RecoverPasswordViewController: RecoverPasswordViewModelDelegate {
    func showSuccessMessage(with message: String) {
        presentAlert(with: message, and: {_ in
            self.navigationController?.popViewController(animated: true)
        })
    }
    func showErrorMessage(with message: String) {
        presentAlert(with: message)
    }
}
