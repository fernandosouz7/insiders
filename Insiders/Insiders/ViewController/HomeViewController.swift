import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
    }
   
    @IBAction func didTapLogoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
                
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
}
