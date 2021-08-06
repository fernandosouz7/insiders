import UIKit

extension UIViewController {

    func presentAlert(with title: String, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func setupNavigation(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
        navigationController?.navigationBar.tintColor =  UIColor(named: "Shamrock")
    }
}
