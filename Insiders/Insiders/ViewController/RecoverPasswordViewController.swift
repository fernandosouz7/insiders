import UIKit

final class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSendButton()
    }

}

extension RecoverPasswordViewController {
    
    private func setupSendButton() {
        sendButton.layer.cornerRadius = 15
    }
}
