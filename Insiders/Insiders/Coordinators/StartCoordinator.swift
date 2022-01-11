import UIKit

protocol StartViewModelCoordinatorDelegate: AnyObject {
    func pushToSignUpViewController()
    func pushToLoginViewController()
}

protocol RecoverPasswordViewModelCoordinatorDelegate: AnyObject {
    func didFinish()
}

protocol SignUpViewModelCoordinatorDelegate: AnyObject {
    func didFinish()
    func pushToLoginViewController()
    func pushToNoUserTypeViewController()
}

protocol LoginViewModelCoordinatorDelegate: AnyObject {
    func pushToRecoverPasswordViewController()
    func pushToSignUpViewController()
    func didFinish()
    func pushToNoUserTypeViewController()
}

final class StartCooordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let startViewModel = StartViewModel(coordinator: self)
        let startViewController = StartViewController(with: startViewModel)
        navigationController.pushViewController(startViewController, animated: false)
    }
}

extension StartCooordinator: StartViewModelCoordinatorDelegate {
    func pushToLoginViewController() {
        let loginViewController = LoginViewController.instantiate()
        let loginViewModel = LoginViewModel(viewDelegate: loginViewController, coordinator: self)
        loginViewController.setup(with: loginViewModel)
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func pushToSignUpViewController() {
        let signUpViewController = SignUpViewController.instantiate()
        let signUpViewModel = SignUpViewModel(viewDelegate: signUpViewController, coordinator: self)
        signUpViewController.setup(with: signUpViewModel)
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}

extension StartCooordinator: SignUpViewModelCoordinatorDelegate,
                             RecoverPasswordViewModelCoordinatorDelegate,
                             LoginViewModelCoordinatorDelegate {

    func didFinish() {
        switch navigationController.visibleViewController {
        case is RecoverPasswordViewController:
            navigationController.popViewController(animated: true)
        default:
            navigationController.popToRootViewController(animated: true)
        }
    }

    func pushToNoUserTypeViewController() {
        let noUserTypeViewController = NoUserTypeViewController()
        navigationController.pushViewController(noUserTypeViewController, animated: true)
    }

    func pushToRecoverPasswordViewController() {
        let recoverPassword = RecoverPasswordViewController.instantiate()
        let recoverPasswordViewModel = RecoverPasswordViewModel(viewDelegate: recoverPassword, coordinator: self)
        recoverPassword.setup(with: recoverPasswordViewModel)
        navigationController.pushViewController(recoverPassword, animated: true)
    }
}
