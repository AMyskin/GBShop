//
//  File.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

extension UIView {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)
    }

    var topSuperview: UIView? {
        var view = superview
        while view?.superview != nil {
            view = view!.superview
        }
        return view
    }

    @objc func dismissKeyboard() {
        topSuperview?.endEditing(true)
    }


    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}

// swiftlint:disable all
public extension UIView {
    @discardableResult func prepareForAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func pinEdgesToSuperviewEdges() {
        self.topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: superview!.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: superview!.rightAnchor).isActive = true
    }
}
