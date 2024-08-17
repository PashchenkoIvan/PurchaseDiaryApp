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
        let reversedIndexPath = IndexPath(row: purchases.count - indexPath.row - 1, section: indexPath.section)
        let currentPurchase = purchases[reversedIndexPath.row]
        let currentCategory = categoryArray.first { $0.id == categoryData.id }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as! PurchaseTableViewCell
        
        cell.cellImageView.image = currentCategory?.image
        cell.cellImageView.tintColor = currentCategory?.color
        cell.purchaseCategoryName.text = currentCategory?.name
        cell.purchaseDateLabel.text = "\(currentPurchase.timestamp)"
        cell.purchasePriceLabel.text = "\(currentPurchase.cost)"
        cell.purchaseNameLabel.text = currentPurchase.text
        
        return cell
    }
    
    
}

extension PurchaseCategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reversedIndexPath = IndexPath(row: purchases.count - indexPath.row - 1, section: indexPath.section)
        
        let purchaseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PurchaseViewController") as! PurchaseViewController
        
        let currentPurchase = purchases[reversedIndexPath.row]
        
        let currentCategory = categoryArray.first{ $0.id == currentPurchase.category }
        
        print(currentPurchase)
        
        purchaseViewController.name = currentPurchase.text
        purchaseViewController.descr = currentPurchase.purchaseDescription ?? ""
        purchaseViewController.latitude = currentPurchase.latitude
        purchaseViewController.longitude = currentPurchase.longitude
        purchaseViewController.category = currentCategory!.name
        purchaseViewController.date = "\(currentPurchase.timestamp)"
        purchaseViewController.price = "\(currentPurchase.cost)"
        
        self.navigationController?.pushViewController(purchaseViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let reversedIndexPath = IndexPath(row: purchases.count - indexPath.row - 1, section: indexPath.section)
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            let alertController = UIAlertController(title: "Deletion", message: "Are you sure you want to delete this purchase?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                BiometricAuthenticator.authenticateWithBiometrics(reason: "Delete purchase") { success in
                    if success {
                        PurchaseObject.deletePurchase(withId: self.purchases[reversedIndexPath.row].id)
                        self.purchases.remove(at: reversedIndexPath.row)
                        self.tableView.reloadData()
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
