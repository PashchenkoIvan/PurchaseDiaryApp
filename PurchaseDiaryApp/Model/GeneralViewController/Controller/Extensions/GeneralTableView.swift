//
//  TableView.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation
import UIKit

extension GeneralViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if notEmptyCategories.count == 0 {
            return 1
        } else {
            return notEmptyCategories.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if notEmptyCategories.count != 0 {
            let purchases = PurchaseObject.getPurchases(byCategory: notEmptyCategories[indexPath.row].id)
            
            var totalSpent = 0.0
            purchases.forEach { purchase in
                totalSpent += purchase.cost
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCategoryTableViewCell", for: indexPath) as! PurchaseCategoryTableViewCell
            
            cell.categoryImageView.image = notEmptyCategories[indexPath.row].image
            cell.categoryNameTextField.text = notEmptyCategories[indexPath.row].name
            cell.categorySpentTextField.text = "\(totalSpent)"
            cell.categoryCountTextField.text = "\(purchases.count)"
            
            return cell
        } else {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
            
            cell.textLabel?.text = "No one purchase"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .lightGray
            
            return cell
        }
    }
    
}

extension GeneralViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchaseCategoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PurchaseCategoryViewController") as! PurchaseCategoryViewController
        
        purchaseCategoryViewController.categoryData = notEmptyCategories[indexPath.row]
        
        self.navigationController?.pushViewController(purchaseCategoryViewController, animated: true)
    }
}
