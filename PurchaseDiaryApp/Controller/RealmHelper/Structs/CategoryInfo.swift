//
//  Category.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 08.08.2024.
//

import Foundation
import UIKit

struct CategoryInfo {
    let id: Int16
    let name: String
    let image: UIImage
}

let categoryArray: [CategoryInfo] = [
    CategoryInfo.init(id: 1, name: "Entertainment", image: UIImage(systemName: "popcorn.circle.fill")!),
    CategoryInfo.init(id: 2, name: "Cafes and Restaurants", image: UIImage(systemName: "fleuron.fill")!),
    CategoryInfo.init(id: 3, name: "Auto", image: UIImage(systemName: "car.circle.fill")!),
    CategoryInfo.init(id: 4, name: "Home Expenses", image: UIImage(systemName: "house.circle.fill")!),
    CategoryInfo.init(id: 5, name: "Personal Expenses", image: UIImage(systemName: "figure.wave.circle.fill")!),
    CategoryInfo.init(id: 6, name: "Health", image: UIImage(systemName: "stethoscope.circle.fill")!),
    CategoryInfo.init(id: 7, name: "Travel", image: UIImage(systemName: "airplane.circle.fill")!),
    CategoryInfo.init(id: 8, name: "Education", image: UIImage(systemName: "book.circle.fill")!),
    CategoryInfo.init(id: 9, name: "Children", image: UIImage(systemName: "figure.and.child.holdinghands")!),
    CategoryInfo.init(id: 10, name: "Pets", image: UIImage(systemName: "dog.circle.fill")!),
    CategoryInfo.init(id: 11, name: "Electronics", image: UIImage(systemName: "visionpro.circle.fill")!),
    CategoryInfo.init(id: 12, name: "Debts and Loans", image: UIImage(systemName: "creditcard.circle.fill")!),
    CategoryInfo.init(id: 13, name: "Kids' Entertainment", image: UIImage(systemName: "figure.2.and.child.holdinghands")!),
    CategoryInfo.init(id: 14, name: "Garden", image: UIImage(systemName: "tree.circle.fill")!),
    CategoryInfo.init(id: 15, name: "Charity", image: UIImage(systemName: "giftcard.fill")!)
]
