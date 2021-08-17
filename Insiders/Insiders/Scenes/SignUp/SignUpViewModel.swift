import Firebase

protocol SignUpViewModelDelegate: AnyObject {

    func showErrorMessage(with message: String)
    func showFullNameErrorMessage(with message: String)
    func showEmailErrorMessage(with message: String)
    func showPasswordErrorMessage(with message: String)
    func didFinishSignUpWithSuccess()
}

final class SignUpViewModel {

    private weak var delegate: SignUpViewModelDelegate?

    init(delegate: SignUpViewModelDelegate) {
        self.delegate = delegate
    }

    func createUser(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {_, error in
            guard let error = error else {
                self.delegate?.didFinishSignUpWithSuccess()
                return
            }
            self.delegate?.showErrorMessage(with: error.localizedDescription)
        }
    }

    func validateEmail(with email: String) {
        if !email.isEmailValid {
            delegate?.showEmailErrorMessage(with: "Please enter a valid email address.")
        }
    }

    func validatePassword(with password: String) {
        if !password.isPasswordValid {
            delegate?.showPasswordErrorMessage(with: "The password must be 6 characters long or more.")
        }
    }

    func validateFullName(with fullName: String) {
        if fullName.isEmpty {
            delegate?.showFullNameErrorMessage(with: "Please provide full name.")
        }
    }
}
