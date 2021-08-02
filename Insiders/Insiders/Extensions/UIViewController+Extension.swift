import UIKit

extension UIViewController {
    
    func presentAlert(with title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setupNavigationBarIsHiddenTrue() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupNavigationBarIsHiddenFalse() {
        navigationController?.navigationBar.isHidden = false
    }
    
}
