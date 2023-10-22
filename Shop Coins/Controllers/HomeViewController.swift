//
//  HomeViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 12.10.23.
//

import UIKit
import SnapKit

class HomeViewController: BasicViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoinCategoryCollectionViewCell.self, forCellWithReuseIdentifier: CoinCategoryCollectionViewCell.id)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let data: [CoinCategory] = [
        .init(label: "Коллекционные фигуры"),
        .init(label: "Ручная работа"),
        .init(label: "Декор для дома"),
        .init(label: "Коллекционные кубки и стаканы"),
        .init(label: "Декоративная броня и оружие"),
        .init(label: "Свечи и благовония"),
        .init(label: "Украшения")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        makeLayout()
        makeConstraints()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func makeLayout() {
        view.addSubview(collectionView)
        
    }
    
    override func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoinCategoryCollectionViewCell.id, for: indexPath)
        guard let cointCell = cell as? CoinCategoryCollectionViewCell else { return .init() }
//        cointCell.set(coin: data[indexPath.row])
        return cointCell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let countOfCells: CGFloat = 2
        
        
        
        let frameCV = collectionView.frame
        let cellWidth = (frameCV.width - (20 * (countOfCells - 1))) / countOfCells
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let productVC = ProductViewController()
        navigationController?.pushViewController(productVC, animated: true)
    }
}
