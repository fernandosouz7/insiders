import UIKit

extension UIViewController {
    func presentAlert(with title: String, and handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
    func setupNavigationBarIsHiddenTrue() {
        navigationController?.navigationBar.isHidden = true
    }
    func setupNavigationBarIsHiddenFalse() {
        navigationController?.navigationBar.isHidden = false
    }
}
