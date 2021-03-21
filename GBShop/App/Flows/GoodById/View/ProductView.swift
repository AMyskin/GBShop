//
//  ProductView.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//
import UIKit

final class ProductView: UIView {

    var model = Model(viewModel: ProductById.ViewModel(name: "", price: "", description: "")) {
        didSet {
            name.text = model.viewModel.name
            price.text = model.viewModel.price
            decr.text = model.viewModel.description
        }
    }

    // MARK: - Properties
    public var callbackAddAction: (() -> Void)?
    public var callbackDeleteAction: (() -> Void)?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.text = "Продукт"
        label.textAlignment = .center
        label.textColor = .headerTextColor
        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.textAlignment = .center
        label.textColor = .headerTextColor
        return label
    }()

    lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена"
        label.textAlignment = .center
        label.textColor = .headerTextColor
        return label
    }()

    lazy var price: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    lazy var dLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.textAlignment = .center
        label.textColor = .headerTextColor
        return label
    }()

    lazy var decr: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    private lazy var stackView = UIStackView()



    lazy var addReview: AppButton = {
        let button = AppButton()
        button.setTitle("Добавить отзыв", for: UIControl.State())
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()

    lazy var delReview: AppButton = {
        let button = AppButton()
        button.setTitle("Удалить отзыв", for: UIControl.State())
        button.addTarget(self, action: #selector(tappedButton2), for: .touchUpInside)
        return button
    }()

    @objc func tappedButton() {
        callbackAddAction?()
    }
    @objc func tappedButton2() {
        callbackDeleteAction?()
    }

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup views
    private func setupUI() {
        setupStackView()
    }

    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            nameLabel,
            name,
            priceLabel,
            price,
            dLabel,
            decr,
            addReview,
            delReview,


        ])
        addSubview(stackView.prepareForAutoLayout())
        stackView.spacing = 32
        stackView.axis = .vertical
        stackView.topAnchor ~= topAnchor + 120
        stackView.leftAnchor ~= leftAnchor + 16
        stackView.rightAnchor ~= rightAnchor - 16
    }

}


// MARK: - Model
extension ProductView {
    struct Model {
        var viewModel: ProductById.ViewModel
    }

}
