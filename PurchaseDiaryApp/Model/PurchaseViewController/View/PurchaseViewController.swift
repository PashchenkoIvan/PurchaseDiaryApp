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
    @IBOutlet weak var purchaseCategoryLabel: UILabel!
    @IBOutlet weak var purchaseDatelabel: UILabel!
    @IBOutlet weak var purchasePriceLabel: UILabel!
    @IBOutlet weak var purchaseDescriptionLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var name: String = ""
    var descr: String = ""
    var category: String = ""
    var date: String = ""
    var price: String = ""
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = name
        
        self.purchaseNameLabel.text = name
        self.purchasePriceLabel.text = price
        self.purchaseDatelabel.text = date
        self.purchaseCategoryLabel.text = category
        self.purchaseDescriptionLabel.text = descr
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.title = purchaseNameLabel.text
        annotation.coordinate = locationCoordinate
        
        mapView.addAnnotation(annotation)
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
