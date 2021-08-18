import UIKit

final class StartCooordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController
        guard let startViewController = startViewController else { return }
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
    }
}
