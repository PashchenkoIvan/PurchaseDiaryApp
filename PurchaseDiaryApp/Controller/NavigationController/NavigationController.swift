//
//  NavigationController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 14.08.2024.
//

import Foundation
import UIKit

extension UINavigationController {
    var previousViewController: UIViewController? {
        guard viewControllers.count > 1 else { return nil }
        return viewControllers[viewControllers.count - 2]
    }
}
