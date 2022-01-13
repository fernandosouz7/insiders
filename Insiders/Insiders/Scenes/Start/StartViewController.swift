import UIKit

final class StartViewController: BaseViewController {

    private var viewModel: StartViewModel?
    
    private var customView: StartViewDelegate {
        return (view as? StartViewDelegate)!
    }

    init(with viewModel: StartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: true)
        customView.configureActions(signUpSelector: #selector(tappedSignUpButton(sender:)),
                                    loginSelector: #selector(tappedLoginButton(sender:)), viewController: self)
    }

    override func loadView() {
        view = StartView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(isHidden: true)
    }

    @objc func tappedSignUpButton(sender: UIButton) {
        viewModel?.showSignUpViewController()
    }

    @objc func tappedLoginButton(sender: UIButton) {
        viewModel?.showLoginViewController()
    }
}
