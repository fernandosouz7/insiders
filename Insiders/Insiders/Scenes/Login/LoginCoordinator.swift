import UIKit

final class LoginCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                as? LoginViewController else { return }
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
}
