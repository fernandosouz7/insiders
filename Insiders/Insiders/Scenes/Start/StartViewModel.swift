protocol StartViewModelCoordinatorDelegate: AnyObject {
    func pushToSignUpViewController()
    func pushToLoginViewController()
}

final class StartViewModel {
    private weak var coordinatorDelegate: StartViewModelCoordinatorDelegate?

    init(coordinator: StartViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = coordinator
    }

    func showSignUpViewController() {
        coordinatorDelegate?.pushToSignUpViewController()
    }

    func showLoginViewController() {
        coordinatorDelegate?.pushToLoginViewController()
    }
}
