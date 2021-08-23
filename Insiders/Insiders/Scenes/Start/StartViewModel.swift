protocol StartViewModelCoordinatorDelegate: AnyObject {
    func pushSignUpViewController()
    func pushLoginViewController()
}

final class StartViewModel {
    weak var coordinatorDelegate: StartViewModelCoordinatorDelegate?

    func showSignUpViewController() {
        coordinatorDelegate?.pushSignUpViewController()
    }

    func showLoginViewController() {
        coordinatorDelegate?.pushLoginViewController()
    }
}
