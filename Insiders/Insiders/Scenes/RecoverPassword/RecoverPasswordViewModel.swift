import Firebase

protocol RecoverPasswordViewModelDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func showSuccessMessage(with message: String, and handler: @escaping ((UIAlertAction) -> Void))
}

protocol RecoverPasswordViewModelCoordinatorDelegate: AnyObject {
    func didFinish()
}

final class RecoverPasswordViewModel {

    private weak var viewDelegate: RecoverPasswordViewModelDelegate?
    private weak var coordinatorDelegate: RecoverPasswordViewModelCoordinatorDelegate?

    init(viewDelegate: RecoverPasswordViewModelDelegate, coordinator: RecoverPasswordViewModelCoordinatorDelegate) {
        self.viewDelegate = viewDelegate
        self.coordinatorDelegate = coordinator
    }

    func sendPasswordReset(with email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard let error = error else {
                self.viewDelegate?.showSuccessMessage(with: "Password reset successfully sent!") { [weak self] _ in
                    self?.didFinish()
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
