//
//  HistoryViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 06.08.2024.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PurchaseObject.getAllPurchases().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let purchases = PurchaseObject.getAllPurchases()
        let currentPurchase = purchases[purchases.count - indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as! PurchaseTableViewCell
        let categoryData = categoryArray.first { $0.id == currentPurchase.category }
        
        cell.selectionStyle = .none
        cell.purchaseNameLabel.text = currentPurchase.text
        cell.purchaseDateLabel.text = "\(currentPurchase.timestamp)"
        cell.purchasePriceLabel.text = "\(currentPurchase.cost)"
        
        if let image = categoryData?.image {
            cell.cellImageView.image = image
        }
        
        if let categoryName = categoryData?.name {
            cell.purchaseCategoryName.text = categoryName
        }
        
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate {
    
}

