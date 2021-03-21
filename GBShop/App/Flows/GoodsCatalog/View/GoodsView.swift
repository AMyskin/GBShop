//
//  GoodsView.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//
import UIKit

final class GoodsView: UIView {

    // MARK: - Properties
    public var callbackMainButtonAction: (() -> Void)?

    var model = Model(goods: []) {
        didSet {
            model.goods.forEach { entry in
                let titleLabel: UILabel = {
                    let label = UILabel()
                    label.font = .systemFont(ofSize: 14, weight: .light)
                    label.text = "Имя товара"
                    label.textAlignment = .center
                    label.textColor = .headerTextColor
                    return label
                }()
                let goodsName: UILabel = {
                    let label = UILabel()
                    label.font = .systemFont(ofSize: 14, weight: .regular)
                    label.text = entry.name
                    label.textAlignment = .center
                    label.textColor = .headerTextColor
                    return label
                }()

                let priceLabel: UILabel = {
                    let label = UILabel()
                    label.font = .systemFont(ofSize: 14, weight: .light)
                    label.text = "Цена"
                    label.textAlignment = .center
                    label.textColor = .headerTextColor
                    return label
                }()
                let price: UILabel = {
                    let label = UILabel()
                    label.font = .systemFont(ofSize: 14, weight: .regular)
                    label.text = entry.price
                    label.textAlignment = .center
                    label.textColor = .headerTextColor
                    return label
                }()

                let descrLabel: UILabel = {
                    let label = UILabel()
                    label.font = .systemFont(ofSize: 14, weight: .light)
                    label.text = "Описание"
                    label.textAlignment = .center
                    label.textColor = .headerTextColor
                    return label
                }()
                let descr: UILabel = {
                    let label = UILabel()
                    label.font = .systemFont(ofSize: 14, weight: .regular)
                    label.text = entry.description
                    label.textAlignment = .center
                    label.textColor = .headerTextColor
                    return label
                }()
                goodsStackView.addArrangedSubview(titleLabel)
                goodsStackView.addArrangedSubview(goodsName)
                goodsStackView.addArrangedSubview(priceLabel)
                goodsStackView.addArrangedSubview(price)
                goodsStackView.addArrangedSubview(descrLabel)
                goodsStackView.addArrangedSubview(descr)
            }
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
extension GoodsView {
    struct Model {
        var goods: [GoodsModel.Goods]
    }

}

