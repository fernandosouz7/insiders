import UIKit

final class StartViewController: BaseViewController {

    private var viewModel: StartViewModel?
    // MARK: - ViewController lifecycle
    init(with viewModel: StartViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavigation(isHidden: true)
    }
    
    override func loadView() {
        view = StartView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(isHidden: true)
    }

    func setup(with viewModel: StartViewModel) {
        self.viewModel = viewModel
    }
}
