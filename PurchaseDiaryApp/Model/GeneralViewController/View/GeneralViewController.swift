// ViewController.swift
// PurchaseDiaryApp
//
// Created by Пащенко Иван on 06.08.2024.
//

import UIKit

class GeneralViewController: UIViewController {
    
    @IBOutlet weak var totalSpentLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var notEmptyCategories: [CategoryInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "General"
        
        if let buttonImage = UIImage(systemName: "plus") {
            let addButton = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(addNewPurchase))
            navigationItem.rightBarButtonItem = addButton
        }
        
        let nib = UINib(nibName: "PurchaseCategoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PurchaseCategoryTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notEmptyCategories = GeneralController.updateNotEmptyCategoriesFunc()
        
        tableView.reloadData()
    }
}
