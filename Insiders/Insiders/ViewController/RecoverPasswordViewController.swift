import UIKit

final class RecoverPasswordViewController: UIViewController {

    @IBOutlet private weak var sendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSendButton()
    }

    private func setupSendButton() {
        sendButton.layer.cornerRadius = 15
    }
}
