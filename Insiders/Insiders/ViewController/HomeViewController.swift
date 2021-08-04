import UIKit
import Firebase

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: true)
    }

    @IBAction private func didTapLogoutButton(_ sender: Any) {
    }
}
