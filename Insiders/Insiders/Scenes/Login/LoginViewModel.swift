import UIKit
import Firebase

protocol LoginViewModelViewDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func didFinishLoginWithSuccess()
}

protocol LoginViewModelCoordinatorDelegate: AnyObject {
    func pushRecoverPasswordViewController()
    func pushSignUpViewController()
    func didFinish()
    func pushNoUserTypeViewController()
}

final class LoginViewModel {

    weak var viewDelegate: LoginViewModelViewDelegate?
    weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?

    func makeLogin(with email: String, and password: String) {
        switch getLoginCredentials(with: email, and: password) {
        case .correct:
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
                guard let error = error else {
                    self?.viewDelegate?.didFinishLoginWithSuccess()
                    self?.coordinatorDelegate?.pushNoUserTypeViewController()
                    return
                }
                self?.setupErrorMessage(with: error.localizedDescription)
            }
        case .incorrect(let message):
            setupErrorMessage(with: message)
        }
    }

    func showRecoverPasswordViewController() {
        coordinatorDelegate?.pushRecoverPasswordViewController()
    }

    func showSignUpViewController() {
        coordinatorDelegate?.pushSignUpViewController()
    }

    func didFinish() {
        coordinatorDelegate?.didFinish()
    }

    private func getLoginCredentials(with email: String, and password: String) -> LoginCredentialsStatus {
        if email.isEmpty && password.isEmpty {
            return .incorrect("Please provide email and password.")
        }
        if email.isEmpty {
            return .incorrect("Email field is empty.")
        }
        if password.isEmpty {
            return .incorrect("Password field is empty.")
        }
        return .correct
    }

    private func setupErrorMessage(with message: String) {
        viewDelegate?.showErrorMessage(with: message)
    }
}

extension LoginViewModel {

    enum LoginCredentialsStatus {
        case correct
        case incorrect(String)
    }
}
