import UIKit

class StartCooordinator: Coordinator {
//    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let startViewController = StartViewController.instantiate()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
    }

    func pushSignUpViewController() {
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        signUpCoordinator.start()
    }

    func pushLoginViewController() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
//        loginCoordinator.parentCoordinator = self
//        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }

//    func childDidFinish(_ child: Coordinator?) {
//        for (index, coordinator) in childCoordinators.enumerated() {
//            if coordinator === child {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
//    }
}
