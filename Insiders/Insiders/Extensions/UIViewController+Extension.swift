import UIKit

extension UIViewController {

    func presentAlert(with title: String, buttonTitle: String = "OK", and handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: handler))
        present(alert, animated: true, completion: nil)
    }

    func setupNavigation(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
        navigationController?.navigationBar.tintColor =  UIColor(named: "Shamrock")
    }
}
