//
//  SearchViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 06.08.2024.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var purchases: [PurchaseObject] = []
    var filteredPurchases: [PurchaseObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PurchaseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PurchaseTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        purchases = Array(PurchaseObject.getAllPurchases())
    }

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PurchaseCellsHelper.isEmptyTable(items: filteredPurchases).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch PurchaseCellsHelper.isEmptyTable(items: filteredPurchases).isEmpty {
        case true:
            return PurchaseCellsHelper.returnEmptyTableCell()
        case false:
            let categoryData = categoryArray.first { $0.id == filteredPurchases[indexPath.row].category }
            
            return PurchaseCellsHelper.returnPurchaseTableCell(indexPath: indexPath, tableView: tableView, currentPurchase: filteredPurchases[indexPath.row], categoryData: categoryData)
        }
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchaseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PurchaseViewController") as! PurchaseViewController
        
        let currentPurchase = filteredPurchases[indexPath.row]
        
        let currentCategory = categoryArray.first{ $0.id == currentPurchase.category }
        
        purchaseViewController.name = currentPurchase.text
        purchaseViewController.descr = currentPurchase.purchaseDescription ?? ""
        purchaseViewController.latitude = currentPurchase.latitude
        purchaseViewController.longitude = currentPurchase.longitude
        purchaseViewController.category = currentCategory!.name
        purchaseViewController.date = "\(currentPurchase.timestamp)"
        purchaseViewController.price = "\(currentPurchase.cost)"
        
        self.navigationController?.pushViewController(purchaseViewController, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPurchases = []
        
        filteredPurchases = purchases.filter { $0.text.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }


    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredPurchases = purchases
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
}

