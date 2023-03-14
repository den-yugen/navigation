//
// Created by Denis Yūgen
//

import UIKit

final class AppButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configureButton()
    }

    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: [.normal, .selected, .highlighted, .disabled])
    }
}
