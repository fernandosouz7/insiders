import UIKit
import Firebase

protocol LoginViewModelDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func didFinishLoginWithSuccess()
}

final class LoginViewModel {

    private weak var delegate: LoginViewModelDelegate?

    init(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }

    func makeLogin(with email: String, and password: String) {
        switch validateLoginCredentials(with: email, and: password) {
        case .correct:
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
                guard let error = error else {
                    self?.delegate?.didFinishLoginWithSuccess()
                    return
                }
                self?.setupErrorMessage(with: error.localizedDescription)
            }
        case .incorrect(let message):
            setupErrorMessage(with: message)
        }
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
        delegate?.showErrorMessage(with: message)
    }
}

extension LoginViewModel {

    enum LoginCredentialsStatus {
        case correct
        case incorrect(String)
    }
}
