import Foundation
import UIKit
import Firebase

final class LoginViewModel {
        
    private var credentials = Credentials() {
        didSet {
            email = credentials.email
            password = credentials.password
        }
    }
    
    private var email = ""
    private var password = ""
    
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var loginResult: Observable<Bool> = Observable(false)

    func updateCredentials(with email: String, and password: String, otp: String? = nil) {
        credentials.email = email
        credentials.password = password
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error == nil {
                self?.loginResult.value = true
            } else {
                guard let error = error else { return }
                self?.errorMessage.value = error.localizedDescription
            }
        }
        
    }
    
    func credentialsInput() -> CredentialsInputStatus {
        if email.isEmpty && password.isEmpty {
            errorMessage.value = "Please provide email and password."
            return .Incorrect
        }
        if email.isEmpty {
            errorMessage.value = "Email field is empty."
            return .Incorrect
        }
        if password.isEmpty {
            errorMessage.value = "Password field is empty."
            return .Incorrect
        }
        return .Correct
    }
}

extension LoginViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
