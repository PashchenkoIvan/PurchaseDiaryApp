//
//  AddPurchaseViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 13.08.2024.
//

import UIKit
import MapKit
import CoreLocation

class AddPurchaseViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var mapKitView: MKMapView!
    @IBOutlet weak var priceTextField: UITextField!
    
    var categoryPickerView = UIPickerView()
    var locationManager = CLLocationManager()
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var categoryId: Int16 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTextField.inputView = categoryPickerView
        
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        
        if let buttonImage = UIImage(systemName: "plus") {
            let addButton = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(addNewPurchase))
            navigationItem.rightBarButtonItem = addButton
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(_:)))
        mapKitView.addGestureRecognizer(tapGesture)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
}
