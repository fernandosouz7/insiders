import UIKit
import Cartography

class NoUserTypeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyViewCode()
    }

    private var textLabel = { return UILabel(frame: .zero) }()

    private func buildHierarchy() {
        addSubview(textLabel)
    }

    private func setupConstraints() {

        constrain(textLabel) { textLabel in
            textLabel.center == textLabel.superview!.center
        }
    }

    private func configureViews() {
        backgroundColor = .systemBackground
        textLabel.text = "You don't have a user type defined yet."
        textLabel.textAlignment = .center
    }

    private func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
