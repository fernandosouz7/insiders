import UIKit

final class StartViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupNavigationController()
    }

}

extension StartViewController {
    
    private func setupButtons(){
        signUpButton.layer.cornerRadius = 15
        
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(red: 62.0/255, green: 213.0/255, blue: 151.0/255, alpha: 1.0).cgColor
        loginButton.layer.cornerRadius = 15
    }
    
    private func setupNavigationController(){
        navigationController?.navigationBar.isHidden = true
    }
}
