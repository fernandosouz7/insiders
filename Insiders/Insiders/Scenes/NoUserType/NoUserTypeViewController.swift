import UIKit

class NoUserTypeViewController: UIViewController {

    private let customView: NoUserTypeView

    override func loadView() {
        view = customView
    }

    init(view: NoUserTypeView = NoUserTypeView()) {
        self.customView = view
        super.init()
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(isHidden: true)
    }
}
