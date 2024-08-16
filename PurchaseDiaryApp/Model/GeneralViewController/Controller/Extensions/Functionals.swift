//
//  Functionals.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 16.08.2024.
//

import Foundation
import UIKit

extension GeneralViewController {
    @objc func addNewPurchase() {
        let addPurchaseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPurchaseViewController") as! AddPurchaseViewController
        
        self.navigationController?.pushViewController(addPurchaseViewController, animated: true)
    }
}
