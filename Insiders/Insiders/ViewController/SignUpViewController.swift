import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet private weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarIsHiddenFalse()
        setupSignUpButton()
    }
    
    private func setupSignUpButton() {
        signUpButton.layer.cornerRadius = 15
    }
}
