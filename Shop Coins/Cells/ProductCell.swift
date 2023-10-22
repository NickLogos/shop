//
//  ProductCell.swift
//  Shop Coins
//
//  Created by Nick Logos on 18.10.23.
//

import UIKit
import SnapKit

class ProductCell: UITableViewCell {
    
    static let id = String(describing: ProductCell.self)
    
    private var productImage: UIImageView = {
        let picture = UIImageView(image: UIImage(systemName: "person.fill"))
        return picture
    }()
    
    private let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.systemMint.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
    }()
    
    private let bagButton: UIButton = {
        let bagButton = UIButton()
        bagButton.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        return bagButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLayout() {
        self.contentView.addSubview(productImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(categoryLabel)
        self.productImage.addSubview(cellView)
        self.cellView.addSubview(priceLabel)
    }
    
    private func makeConstraints() {
        
        productImage.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.leading.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0))
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImage.snp.trailing).offset(10)
            make.top.equalToSuperview().inset(5)
            
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(productImage.snp.trailing).offset(10)
        }
        
        cellView.snp.makeConstraints { make in
            make.bottom.equalTo(productImage.snp.bottom).offset(-3)
            make.leading.equalTo(productImage.snp.leading).offset(2)
            make.trailing.equalTo(productImage.snp.trailing).offset(-2)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(cellView.snp.bottom).offset(-2)
            make.leading.equalTo(cellView.snp.leading).offset(2)
            make.trailing.equalTo(cellView.snp.trailing).offset(-2)
        }
    }
}


