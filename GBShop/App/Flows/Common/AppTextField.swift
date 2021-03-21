//
//  AppTextField.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

enum StatusTextField {
    case inactive
    case active
    case error
    case success
}

class AppTextField: UIView {
    let font = UIFont.systemFont(ofSize: 16, weight: .regular)
    var text = ""

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .ultraLight)])
        textField.backgroundColor = .textFieldColor
        textField.layer.cornerRadius = 25
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 16,
                                                  height: 50))
        textField.leftViewMode = .always
        textField.placeholder = text
        textField.textColor = .mainTextColor
        textField.font = font
        return textField
    }()
    private var _status: StatusTextField?
    var status: StatusTextField {
        get {
            if let value = _status { return value }
            let initialValue = StatusTextField.inactive
            _status = initialValue
            return initialValue
        }
        set {
            _status = newValue
            switch newValue {
            case .active:
                textField.textColor = .mainTextColor
            case .inactive:
                textField.textColor = .mainTextColor
            case .error:
                textField.textColor = .errorTextColor
            case .success:
                textField.textColor = .agreeColor
            }
        }
    }

    convenience init(title: String) {
        self.init()
        self.text = title
        addSubviews()
        setUpConstraints()
    }

    private func addSubviews() {
        [textField]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
