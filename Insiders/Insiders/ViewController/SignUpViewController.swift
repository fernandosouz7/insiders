import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupSignUpButton()
    }
    
}

extension SignUpViewController {
    
    private func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupSignUpButton() {
        signUpButton.layer.cornerRadius = 15
    }
}
