import UIKit

extension UIViewController {

    func presentAlert(with title: String, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func setupNavigationBarIsHidden(value: Bool) {
        navigationController?.navigationBar.isHidden = value
    }
}
