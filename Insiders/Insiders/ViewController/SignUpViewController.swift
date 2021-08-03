import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet private weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarIsHidden(value: false)
        setupSignUpButton()
    }

    private func setupSignUpButton() {
        signUpButton.layer.cornerRadius = 15
    }
}
