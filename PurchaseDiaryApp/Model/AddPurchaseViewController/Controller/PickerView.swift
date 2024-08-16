//
//  PickerView.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 14.08.2024.
//

import Foundation
import UIKit

extension AddPurchaseViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryArray[row].name
        categoryId = categoryArray[row].id
        categoryTextField.resignFirstResponder()
    }
}

extension AddPurchaseViewController: UIPickerViewDelegate {
    
}
