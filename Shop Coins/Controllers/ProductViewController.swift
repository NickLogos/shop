//
//  ProductViewController.swift
//  Shop Coins
//
//  Created by Nick Logos on 18.10.23.
//

import UIKit
import SnapKit

class ProductViewController: BasicViewController {
    
    private var productTable: UITableView = {
       let table = UITableView()
        table.register(ProductCell.self, forCellReuseIdentifier: ProductCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        productTable.dataSource = self
        productTable.delegate = self

    }
    override func makeLayout() {
        view.addSubview(productTable)
    }
    
    override func makeConstraints() {
        productTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductCell.id, for: indexPath)
        guard let productCell = cell as? ProductCell else { return .init() }
//        productCell.set(coin: data[indexPath.row])
        return productCell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productTable.deselectRow(at: indexPath, animated: true)
    }
}
