//
//  NewPurchase.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 14.08.2024.
//

import Foundation

extension AddPurchaseViewController {
    @objc func addNewPurchase() {
        if let priceText = priceTextField.text,
           let price = Double(priceText) {
            
            PurchaseObject.create(text: nameTextField.text ?? "Not given", cost: price, category: categoryId, latitude: latitude, longitude: longitude, description: descriptionTextField.text)
            
            if let previousVC = navigationController?.previousViewController {
                navigationController?.popToViewController(previousVC, animated: true)
            }
        } else {
            print("Ошибка: неверные данные")
        }
    }
}
