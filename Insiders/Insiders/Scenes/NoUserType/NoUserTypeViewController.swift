import UIKit

final class NoUserTypeViewController: UIViewController {

    private let customView: NoUserTypeView

    init(view: NoUserTypeView = NoUserTypeView()) {
        self.customView = view
        super.init()
    }

    required init?(coder: NSCoder) {
        nil
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.customView = NoUserTypeView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func loadView() {
        view = NoUserTypeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: true)
    }
}
