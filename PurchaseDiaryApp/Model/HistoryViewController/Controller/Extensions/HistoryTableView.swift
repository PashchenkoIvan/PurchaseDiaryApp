//
//  TableView.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation
import UIKit

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PurchaseCellsHelper.isEmptyTable(items: purchases).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if purchases.count == 0 {
            return PurchaseCellsHelper.returnEmptyTableCell()
        } else {
            let reversedIndexPath = IndexPath(row: purchases.count - indexPath.row - 1, section: indexPath.section)
            let currentPurchase = purchases[reversedIndexPath.row]
            let categoryData = categoryArray.first { $0.id == currentPurchase.category }
            
            return PurchaseCellsHelper.returnPurchaseTableCell(indexPath: indexPath, tableView: tableView, currentPurchase: currentPurchase, categoryData: categoryData)
        }
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchaseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PurchaseViewController") as! PurchaseViewController
        
        let currentPurchase = purchases[indexPath.row]
        
        let currentCategory = categoryArray.first{ $0.id == currentPurchase.category }
        
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
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            let alertController = UIAlertController(title: "Deletion", message: "Are you sure you want to delete this purchase?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                BiometricAuthenticator.authenticateWithBiometrics(reason: "Delete purchase") { success in
                    if success {
                        let currentPurchase = self.purchases[indexPath.row]
                        PurchaseObject.deletePurchase(withId: currentPurchase.id)
                        
                        self.purchases.remove(at: indexPath.row)
                        self.tableView.reloadData()
                        
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
