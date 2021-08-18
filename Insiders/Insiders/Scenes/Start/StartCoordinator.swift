import UIKit

class StartCooordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController")
                as? StartViewController else { return  }
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
    }

    func pushSignUpViewController() {
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        signUpCoordinator.start()
    }

    func pushLoginViewController() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
}
