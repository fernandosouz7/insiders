import UIKit

class StartCooordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let startViewController = StartViewController.instantiate()
        let startViewModel = StartViewModel()
        startViewModel.coordinatorDelegate = self
        startViewController.setup(with: startViewModel)
        navigationController.pushViewController(startViewController, animated: false)
    }

    func didFinish() {
        switch navigationController.visibleViewController {
        case is RecoverPasswordViewController:
            navigationController.popViewController(animated: true)
        default:
            navigationController.popToRootViewController(animated: true)
        }
    }
}

extension StartCooordinator: StartViewModelCoordinatorDelegate {
    func pushLoginViewController() {
        let loginViewController = LoginViewController.instantiate()
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinatorDelegate = self
        loginViewController.setup(with: loginViewModel)
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func pushSignUpViewController() {
        let signUpViewController = SignUpViewController.instantiate()
        let signUpViewModel = SignUpViewModel()
        signUpViewModel.coordinator = self
        signUpViewController.setup(with: signUpViewModel)
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}

extension StartCooordinator: SignUpViewModelCoordinatorDelegate {

}

extension StartCooordinator: LoginViewModelCoordinatorDelegate {
    func pushRecoverPasswordViewController() {
        let recoverPassword = RecoverPasswordViewController.instantiate()
        let recoverPasswordViewModel = RecoverPasswordViewModel()
        recoverPasswordViewModel.coordinatorDelegate = self
        recoverPassword.setup(with: recoverPasswordViewModel)
        navigationController.pushViewController(recoverPassword, animated: true)
    }
}

extension StartCooordinator: RecoverPasswordViewModelCoordinatorDelegate {

}
