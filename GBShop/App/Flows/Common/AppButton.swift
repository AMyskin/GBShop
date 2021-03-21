//
//  AppButton.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

class AppButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainButtonColor
        setTitleColor(.mainButtonTextColor, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
