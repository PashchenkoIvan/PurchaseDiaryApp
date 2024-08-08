//
//  RealmHelper.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 08.08.2024.
//

import Foundation
import RealmSwift

class PurchaseObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var text: String
    @Persisted var cost: Double
    @Persisted var timestamp: Date
    @Persisted var category: String
    @Persisted var latitude: Double // Широта
    @Persisted var longitude: Double // Долгота
    @Persisted var purchaseDescription: String? // Описание (опциональное)
}

extension PurchaseObject {
    static func getAllPurchases() -> [PurchaseObject] {
        let realm = try! Realm()
        return Array(realm.objects(PurchaseObject.self))
    }
}

extension PurchaseObject {
    static func addPurchase(text: String? = nil, cost: Double = 0.0, latitude: Double? = nil, longitude: Double? = nil, description: String? = "Not given") {
        let newPurchase = PurchaseObject()

        newPurchase.text = text ?? "Not given"
        newPurchase.cost = cost
        newPurchase.timestamp = Date()
        newPurchase.latitude = latitude ?? 0.0
        newPurchase.longitude = longitude ?? 0.0
        newPurchase.purchaseDescription = description ?? "Not given"

        let realm = try! Realm()

        try! realm.write {
            realm.add(newPurchase)
        }
    }
}

extension PurchaseObject {
    static func deletePurchase(withId id: ObjectId) {
        let realm = try! Realm()
        if let purchaseToDelete = realm.object(ofType: PurchaseObject.self, forPrimaryKey: id) {
            try! realm.write {
                realm.delete(purchaseToDelete)
            }
        }
    }
}
