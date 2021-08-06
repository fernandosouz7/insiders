import Firebase

protocol RecoverPasswordViewModelDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func showSuccessMessage(with message: String)
}

final class RecoverPasswordViewModel {

    private weak var delegate: RecoverPasswordViewModelDelegate?

    init(delegate: RecoverPasswordViewModelDelegate) {
        self.delegate = delegate
    }

    func sendPasswordReset(with email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard let error = error else {
                self.delegate?.showSuccessMessage(with: "Password reset successfully sent!")
                return
            }
            self.delegate?.showErrorMessage(with: error.localizedDescription)
        }
    }
}
