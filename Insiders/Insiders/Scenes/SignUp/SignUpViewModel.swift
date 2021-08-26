import Firebase

protocol SignUpViewModelDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func showFullNameErrorMessage(with message: String)
    func showEmailErrorMessage(with message: String)
    func showPasswordErrorMessage(with message: String)
}

protocol SignUpViewModelCoordinatorDelegate: AnyObject {
    func didFinish()
    func pushToLoginViewController()
    func pushToNoUserTypeViewController()
}

final class SignUpViewModel {

    private weak var viewDelegate: SignUpViewModelDelegate?
    private weak var coordinatorDelegate: SignUpViewModelCoordinatorDelegate?

    init(viewDelegate: SignUpViewModelDelegate, coordinator: SignUpViewModelCoordinatorDelegate) {
        self.viewDelegate = viewDelegate
        self.coordinatorDelegate = coordinator
    }

    func createUser(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
            guard let error = error else {
                self?.didFinishSignUpWithSuccess()
                return
            }
            self?.viewDelegate?.showErrorMessage(with: error.localizedDescription)
        }
    }

    func validateEmail(with email: String) {
        if !email.isEmailValid {
            viewDelegate?.showEmailErrorMessage(with: "Please enter a valid email address.")
        }
    }

    func validatePassword(with password: String) {
        if !password.isPasswordValid {
            viewDelegate?.showPasswordErrorMessage(with: "The password must be 6 characters long or more.")
        }
    }

    func validateFullName(with fullName: String) {
        if fullName.isEmpty {
            viewDelegate?.showFullNameErrorMessage(with: "Please provide full name.")
        }
    }

    func showLoginViewController() {
        coordinatorDelegate?.pushToLoginViewController()
    }

    func didFinish() {
        coordinatorDelegate?.didFinish()
    }

    func didFinishSignUpWithSuccess() {
        coordinatorDelegate?.pushToNoUserTypeViewController()
    }
}
