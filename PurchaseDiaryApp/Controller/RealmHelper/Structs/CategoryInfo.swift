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
    let color: UIColor
}

let categoryArray: [CategoryInfo] = [
    CategoryInfo(id: 1, name: "Entertainment", image: UIImage(systemName: "popcorn.circle.fill")!, color: .systemYellow),
    CategoryInfo(id: 2, name: "Cafes and Restaurants", image: UIImage(systemName: "fleuron.fill")!, color: .systemOrange),
    CategoryInfo(id: 3, name: "Auto", image: UIImage(systemName: "car.circle.fill")!, color: .systemRed),
    CategoryInfo(id: 4, name: "Home Expenses", image: UIImage(systemName: "house.circle.fill")!, color: .systemBlue),
    CategoryInfo(id: 5, name: "Personal Expenses", image: UIImage(systemName: "figure.wave.circle.fill")!, color: .systemGreen),
    CategoryInfo(id: 6, name: "Health", image: UIImage(systemName: "stethoscope.circle.fill")!, color: .systemTeal),
    CategoryInfo(id: 7, name: "Travel", image: UIImage(systemName: "airplane.circle.fill")!, color: .systemPurple),
    CategoryInfo(id: 8, name: "Education", image: UIImage(systemName: "book.circle.fill")!, color: .systemIndigo),
    CategoryInfo(id: 9, name: "Children", image: UIImage(systemName: "figure.and.child.holdinghands")!, color: .systemPink),
    CategoryInfo(id: 10, name: "Pets", image: UIImage(systemName: "dog.circle.fill")!, color: .systemBrown),
    CategoryInfo(id: 11, name: "Electronics", image: UIImage(systemName: "visionpro.circle.fill")!, color: .systemGray),
    CategoryInfo(id: 12, name: "Debts and Loans", image: UIImage(systemName: "creditcard.circle.fill")!, color: .systemYellow),
    CategoryInfo(id: 13, name: "Kids' Entertainment", image: UIImage(systemName: "figure.2.and.child.holdinghands")!, color: .systemOrange),
    CategoryInfo(id: 14, name: "Garden", image: UIImage(systemName: "tree.circle.fill")!, color: .systemGreen),
    CategoryInfo(id: 15, name: "Charity", image: UIImage(systemName: "giftcard.fill")!, color: .systemRed)
]

