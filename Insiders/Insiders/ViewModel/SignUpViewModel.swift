import Firebase

protocol SignUpViewModelDelegate: AnyObject {

    func showErrorMessage(with message: String)
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
}
