import UIKit

final class SignUpCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController  = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
                as? SignUpViewController else { return }
        signUpViewController.setupViewModel(
            with: SignUpViewModel(
                delegate: signUpViewController as SignUpViewModelDelegate))
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}
