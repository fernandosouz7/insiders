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
    
    var errorMessage: Observable<String?> = Observable(nil)
    var loginResult: Observable<Bool> = Observable(false)

    func updateCredentials(with email: String, and password: String, otp: String? = nil) {
        credentials.email = email
        credentials.password = password
    }
    
    func makeLogin() {
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
            return .incorrect
        }
        if email.isEmpty {
            errorMessage.value = "Email field is empty."
            return .incorrect
        }
        if password.isEmpty {
            errorMessage.value = "Password field is empty."
            return .incorrect
        }
        return .correct
    }
}

extension LoginViewModel {
    enum CredentialsInputStatus {
        case correct
        case incorrect
    }
}
