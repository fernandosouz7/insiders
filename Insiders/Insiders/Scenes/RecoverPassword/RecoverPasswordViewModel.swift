import Firebase

protocol RecoverPasswordViewModelViewDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func showSuccessMessage(with message: String, and handler: @escaping ((UIAlertAction) -> Void))
}

protocol RecoverPasswordViewModelCoordinatorDelegate: AnyObject {
    func didFinish()
}

final class RecoverPasswordViewModel {

    weak var viewDelegate: RecoverPasswordViewModelViewDelegate?
    weak var coordinatorDelegate: RecoverPasswordViewModelCoordinatorDelegate?

    func sendPasswordReset(with email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard let error = error else {
                self.viewDelegate?.showSuccessMessage(with: "Password reset successfully sent!") { _ in
                    self.didFinish()
                }
                return
            }
            self.viewDelegate?.showErrorMessage(with: error.localizedDescription)
        }
    }

    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
