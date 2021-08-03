import Firebase

protocol SignUpViewModelDelegate: AnyObject {
    func showErrorMessage(with message: String)
}

final class SignUpViewModel {
    private weak var delegate: SignUpViewModelDelegate?
    init(delegate: SignUpViewModelDelegate) {
        self.delegate = delegate
    }
    func createUser(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {_, error in
            guard let error = error else { return }
            self.delegate?.showErrorMessage(with: error.localizedDescription)
        }
    }
//    func validateSignUpCredentials(email: String, password: String) {
//        
//    }
//    func validateEmailInput() {
//        
//    }
}
