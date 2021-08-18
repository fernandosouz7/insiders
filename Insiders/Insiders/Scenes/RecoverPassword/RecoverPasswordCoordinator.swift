import UIKit

final class RecoverPasswordCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let recoverPasswordViewController = storyboard.instantiateViewController(withIdentifier: "RecoverPasswordViewController")
                as? RecoverPasswordViewController else { return }
        recoverPasswordViewController.setupViewModel(
            with: RecoverPasswordViewModel(
                delegate: recoverPasswordViewController as RecoverPasswordViewModelDelegate))
//        recoverPassword.coordinator = self
        navigationController.pushViewController(recoverPasswordViewController, animated: true)
    }
}
