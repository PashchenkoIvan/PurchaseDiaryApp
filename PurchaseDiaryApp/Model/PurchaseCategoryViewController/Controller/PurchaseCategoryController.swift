//
//  PurchaseCategoryController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation

class PurchaseCategoryController {
    static func calcTotalSpent (purchases: [PurchaseObject]) -> Double {
        var totalSpent = 0.0
        purchases.forEach { purchase in
            totalSpent += purchase.cost
        }
        
        return totalSpent
    }
}
