import UIKit

final class SignUpViewController: BaseViewController {

    private var viewModel: SignUpViewModel?
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        view = SignUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButton(selector: #selector(didTapBackButton))
        setupNavigation(isHidden: false)
        setupTitle()
    }

    private func setupTitle() {
        self.title = "Criar Conta"
    }

    @objc private func didTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @objc private func didTapBackButton() {
        viewModel?.didFinish()
    }
}
