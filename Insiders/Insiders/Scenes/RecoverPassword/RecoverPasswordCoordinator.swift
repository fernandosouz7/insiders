import UIKit

final class RecoverPasswordCoordinator: Coordinator {
//    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

//    lazy var recoverPasswordViewModel: RecoverPasswordViewModel = {
//        let viewModel = RecoverPasswordViewModel(coordinator: self)
//        return viewModel
//    }()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let recoverPasswordViewController = RecoverPasswordViewController.instantiate()
        let recoverPasswordViewModel = RecoverPasswordViewModel()
        recoverPasswordViewModel.coordinatorDelegate = self
        recoverPasswordViewController.setup(with: recoverPasswordViewModel)
        navigationController.pushViewController(recoverPasswordViewController, animated: true)
    }
}

extension RecoverPasswordCoordinator: RecoverPasswordViewModelCoordinatorDelegate {
    func didFinish() {
        navigationController.popViewController(animated: true)
    }
}
