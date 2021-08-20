import UIKit

final class LoginCoordinator: Coordinator {
//    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
//    weak var parentCoordinator: StartCooordinator?

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let loginViewController = LoginViewController.instantiate()
        loginViewController.setupViewModel(
            with: LoginViewModel(
                delegate: loginViewController as LoginViewModelDelegate))
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func pushRecoverPasswordViewController() {
        let recoverPasswordCoordinator = RecoverPasswordCoordinator(navigationController: navigationController)
        recoverPasswordCoordinator.start()
    }

    func pushSignUpViewController() {
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        signUpCoordinator.start()
    }

    func didFinishLogin() {
//        parentCoordinator?.childDidFinish(self)
        navigationController.popToRootViewController(animated: true)
    }
}
