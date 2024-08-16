//
//  GeneralController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation

class GeneralController {
    static func updateNotEmptyCategoriesFunc () -> [CategoryInfo] {
        var categories: [CategoryInfo] = []
        
        categoryArray.forEach { category in
            let purchases = PurchaseObject.getPurchases(byCategory: category.id)
            
            if purchases.count != 0 {
                categories.append(category)
            }
        }
        return categories
    }
}
