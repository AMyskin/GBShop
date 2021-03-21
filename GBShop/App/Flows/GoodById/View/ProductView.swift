//
//  ProductView.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//
import UIKit

final class ProductView: UIView {

    // MARK: - Properties
    public var callbackMainButtonAction: (() -> Void)?

    var model = Model(product: "asd") {
        didSet {

        }
    }

    var submitButtonAction: ((_ amount: Double) -> Void)?
    private lazy var titleLabel = UILabel()
    private lazy var scrollView = UIScrollView()
    private lazy var goodsStackView = UIStackView()
    private lazy var stackView = UIStackView()
    private lazy var actionButton = AppButton()


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
        //backgroundColor = .red

        setupTitleLabel()
        setupActionButton()

        setupGoodsStackView()
        setupStackView()
        setupScrollView()
        setupActionButton()
    }

    private func setupTitleLabel() {
        titleLabel.prepareForAutoLayout()
        titleLabel.font = .systemFont(ofSize: 20, weight: .black)
        titleLabel.text = "Каталог Товаров"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .headerTextColor
    }

    private func setupScrollView() {
        addSubview(scrollView.prepareForAutoLayout())
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pinEdgesToSuperviewEdges(excluding: .bottom)
        scrollView.bottomAnchor ~= actionButton.topAnchor + 16
    }

    private func setupGoodsStackView() {
        goodsStackView.axis = .vertical
        goodsStackView.spacing = 16
    }

    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            goodsStackView
        ])
        scrollView.addSubview(stackView.prepareForAutoLayout())
        stackView.spacing = 32
        stackView.axis = .vertical
        stackView.pinEdgesToSuperviewEdges()

    }

    private func setupActionButton() {
        addSubview(actionButton.prepareForAutoLayout())
        actionButton.bottomAnchor ~= bottomAnchor - 32
        actionButton.leftAnchor ~= leftAnchor + 32
        actionButton.rightAnchor ~= rightAnchor - 32
        actionButton.setTitle("Выход", for: UIControl.State())
        actionButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc func tappedButton() {
        callbackMainButtonAction?()
    }

}

// MARK: - Model
extension ProductView {
    struct Model {
        var product: String
    }

}
