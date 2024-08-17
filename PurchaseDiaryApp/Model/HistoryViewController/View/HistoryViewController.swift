//
//  HistoryViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 06.08.2024.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var purchases: [PurchaseObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PurchaseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PurchaseTableViewCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let results = PurchaseObject.getAllPurchases()
        purchases = Array(results)
        
        tableView.reloadData()
    }
}
