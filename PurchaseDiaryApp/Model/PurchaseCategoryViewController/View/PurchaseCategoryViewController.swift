//
//  PurchaseTypeViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 07.08.2024.
//

import UIKit

class PurchaseCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var totalSpentLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryData: CategoryInfo = CategoryInfo(id: 0, name: "", image: UIImage(systemName: "minus")!, color: UIColor.gray)
    var purchases: [PurchaseObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PurchaseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PurchaseTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let results = PurchaseObject.getPurchases(byCategory: categoryData.id)
        purchases = Array(results)
        
        categoryLabel.text = categoryData.name
        
        totalCountLabel.text = "\(purchases.count)"
        totalSpentLabel.text = "\(PurchaseCategoryController.calcTotalSpent(purchases: purchases))"
        
        self.navigationItem.title = categoryData.name
    }
    
}
