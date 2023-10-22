//
//  CoinCategoryCollectionViewCell.swift
//  Shop Coins
//
//  Created by Nick Logos on 15.10.23.
//

import UIKit
import SnapKit

class CoinCategoryCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: CoinCategoryCollectionViewCell.self)
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLayout() {
        addSubview(imageView)
        addSubview(label)
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(50)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
        }
    }
    
//    func set(coin: CoinCategory) {
//        self.imageView.image = coin.image
//        self.label.text = coin.label
//    }
}
