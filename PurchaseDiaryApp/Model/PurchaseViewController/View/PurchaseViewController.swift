//
//  PurchaseViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 07.08.2024.
//

import UIKit
import MapKit

class PurchaseViewController: UIViewController {

    @IBOutlet weak var purchaseNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var purchasePriceLabel: UIView!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var purchaseGroupLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
