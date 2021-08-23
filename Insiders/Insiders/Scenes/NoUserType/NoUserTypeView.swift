import UIKit

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
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])
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
