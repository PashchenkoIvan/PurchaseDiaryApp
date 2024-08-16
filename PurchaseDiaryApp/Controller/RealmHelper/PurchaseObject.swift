//
//  RealmHelper.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 08.08.2024.
//

import Foundation
import UIKit
import RealmSwift

class PurchaseObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var text: String
    @Persisted var cost: Double
    @Persisted var timestamp: Date
    @Persisted var category: Int16
    @Persisted var latitude: Double
    @Persisted var longitude: Double
    @Persisted var purchaseDescription: String?
}

extension PurchaseObject {
    static func create(text: String, cost: Double, category: Int16, latitude: Double, longitude: Double, description: String?) {
        let newPurchase = PurchaseObject()
        newPurchase.text = text
        newPurchase.cost = cost
        newPurchase.timestamp = Date()
        newPurchase.category = category
        newPurchase.latitude = latitude
        newPurchase.longitude = longitude
        newPurchase.purchaseDescription = description
        
        // Get the default Realm instance
        let realm = try! Realm()
        try! realm.write {
            realm.add(newPurchase)
        }
    }
}

extension PurchaseObject {
    static func getAllPurchases() -> Results<PurchaseObject> {
        let realm = try! Realm()
        return realm.objects(PurchaseObject.self)
    }
}

extension PurchaseObject {
    static func getPurchases(byCategory category: Int16) -> Results<PurchaseObject> {
        let realm = try! Realm()
        return realm.objects(PurchaseObject.self).filter("category == %@", category)
    }
}

extension PurchaseObject {
    static func getPurchase(by id: ObjectId) -> PurchaseObject? {
        let realm = try! Realm()
        return realm.object(ofType: PurchaseObject.self, forPrimaryKey: id)
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
