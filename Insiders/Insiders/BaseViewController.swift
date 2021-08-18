import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupLeftBarButton(selector: Selector) {
        let leftBarButtonItem =  UIBarButtonItem(
            image: UIImage(named: "back_icon"),
            style: .plain,
            target: self,
            action: selector)
        leftBarButtonItem.imageInsets = UIEdgeInsets(top: 2, left: -8, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

}
