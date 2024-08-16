//
//  TableView.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation
import UIKit

extension PurchaseCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentPurchase = purchases[indexPath.row]
        let currentCategory = categoryArray.first { $0.id == categoryData.id }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as! PurchaseTableViewCell
        
        cell.cellImageView.image = currentCategory?.image
        cell.purchaseCategoryName.text = currentCategory?.name
        cell.purchaseDateLabel.text = "\(currentPurchase.timestamp)"
        cell.purchasePriceLabel.text = "\(currentPurchase.cost)"
        cell.purchaseNameLabel.text = currentPurchase.text
        
        return cell
    }
    
    
}

extension PurchaseCategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            let alertController = UIAlertController(title: "Deletion", message: "Are you sure you want to delete this purchase?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                BiometricAuthenticator.authenticateWithBiometrics(reason: "Delete purchase") { success in
                    if success {
                        PurchaseObject.deletePurchase(withId: self.purchases[indexPath.row].id)
                        self.purchases.remove(at: indexPath.row)
                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                        self.totalCountLabel.text = "\(self.purchases.count)"
                        self.totalSpentLabel.text = "\(PurchaseCategoryController.calcTotalSpent(purchases: self.purchases))"
                        completionHandler(true)
                    }
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                completionHandler(false)
            }
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
