//
//  PurchaseCellsHelper.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation
import UIKit

struct isEmptyTableResult {
    let count: Int
    let isEmpty: Bool
}

class PurchaseCellsHelper {
    
    static func calcTotalSpent(item: [PurchaseObject]) -> Double {
        var count: Double = 0.0
        item.forEach { purchase in
            count += purchase.cost
        }
        
        return count
    }
    
    static func isEmptyTable<T>(items: [T]) -> isEmptyTableResult {
        if items.isEmpty {
            return isEmptyTableResult(count: 1, isEmpty: true)
        } else {
            return isEmptyTableResult(count: items.count, isEmpty: false)
        }
    }
    
    static func returnEmptyTableCell() -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel?.text = "No one purchase"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .lightGray
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    static func returnPurchaseTableCell(indexPath: IndexPath, tableView: UITableView, currentPurchase: PurchaseObject, categoryData: CategoryInfo?) -> PurchaseTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as! PurchaseTableViewCell
        
        cell.selectionStyle = .none
        cell.purchaseNameLabel.text = currentPurchase.text
        cell.purchaseDateLabel.text = "\(currentPurchase.timestamp)"
        cell.purchasePriceLabel.text = "\(currentPurchase.cost)"
        
        if let image = categoryData?.image {
            cell.cellImageView.image = image
            cell.cellImageView.tintColor = categoryData?.color
        }
        
        if let categoryName = categoryData?.name {
            cell.purchaseCategoryName.text = categoryName
        }
        
        return cell
    }
}
