import UIKit
import Cartography

final class NoUserTypeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyViewCode()
    }

    private var textLabel = UILabel()

    private func addSubviews() {
        addSubview(textLabel)
    }

    private func setupConstraints() {

        constrain(textLabel, self) { textLabel, superView in
            textLabel.center == superView.center
        }
    }

    private func configureViews() {
        backgroundColor = .systemBackground
        textLabel.text = "You don't have a user type defined yet."
        textLabel.textAlignment = .center
    }

    private func applyViewCode() {
        addSubviews()
        setupConstraints()
        configureViews()
    }
}
