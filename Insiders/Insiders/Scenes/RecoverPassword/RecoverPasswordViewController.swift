import UIKit

final class RecoverPasswordViewController: BaseViewController, Storyboardable {
    // MARK: - Private Properties
    private var viewModel: RecoverPasswordViewModel?

    // MARK: - IBOutlets
    @IBOutlet private weak var sendButton: UIButton!
    @IBOutlet private weak var emailTextField: UITextField!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButton(selector: #selector(didTapBackButton))
        setupSendButton()
    }

    // MARK: - IBActions
    @IBAction private func didTapSendButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let recoverPasswordViewModel = viewModel else { return }
        recoverPasswordViewModel.sendPasswordReset(with: email)
    }

    // MARK: - Public functions
    func setup(with viewModel: RecoverPasswordViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private func
    private func setupSendButton() {
        sendButton.layer.cornerRadius = 15
    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }
}

// MARK: - Recover Password View Model Delegate
extension RecoverPasswordViewController: RecoverPasswordViewModelDelegate {
    func showSuccessMessage(with message: String, and handler: @escaping ((UIAlertAction) -> Void)) {
        presentAlert(with: message, and: handler)
    }

    func showErrorMessage(with message: String) {
        presentAlert(with: message)
    }
}
