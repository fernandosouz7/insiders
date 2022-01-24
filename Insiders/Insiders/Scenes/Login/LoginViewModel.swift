import UIKit
import Firebase

final class LoginViewModel {

    private weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?

    init(coordinator: LoginViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = coordinator
    }

    func makeLogin(with email: String, and password: String, completion: @escaping (Bool) -> Void) {
        switch getLoginCredentials(with: email, and: password) {
        case .correct:
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
                guard let error = error else {
                    self?.coordinatorDelegate?.pushToNoUserTypeViewController()
                    completion(true)
                    return
                }
                self?.setupErrorMessage(with: error.localizedDescription)
                completion(true)
            }
        case .incorrect(let message):
            setupErrorMessage(with: message)
            completion(true)
        }
    }

    func showRecoverPasswordViewController() {
        coordinatorDelegate?.pushToRecoverPasswordViewController()
    }

    func showSignUpViewController() {
        coordinatorDelegate?.pushToSignUpViewController()
    }

    func didFinish() {
        coordinatorDelegate?.didFinish()
    }

    private func getLoginCredentials(with email: String, and password: String) -> LoginCredentialsStatus {
        if email.isEmpty && password.isEmpty {
            return .incorrect("Por favor informe email e senha.")
        }
        if email.isEmpty {
            return .incorrect("O campo de email está vazio.")
        }
        if password.isEmpty {
            return .incorrect("O campo de senha está vazio.")
        }
        return .correct
    }

    private func setupErrorMessage(with message: String) {
        coordinatorDelegate?.showErrorMessage(with: message)
    }
}

extension LoginViewModel {

    enum LoginCredentialsStatus {
        case correct
        case incorrect(String)
    }
}
