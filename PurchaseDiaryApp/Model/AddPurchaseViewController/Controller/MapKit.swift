//
//  MapKit.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 14.08.2024.
//

import Foundation
import MapKit

extension AddPurchaseViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapKitView.setRegion(region, animated: true)
        }
    }
}

extension AddPurchaseViewController {
    @objc func handleMapTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let locationInView = gestureRecognizer.location(in: mapKitView)
        let coordinate = mapKitView.convert(locationInView, toCoordinateFrom: mapKitView)
        
        // Remove the old annotation (if any)
        if let oldAnnotation = mapKitView.annotations.first {
            mapKitView.removeAnnotation(oldAnnotation)
        }
        
        // Create a new annotation with a red marker
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Purchase place"
        mapKitView.addAnnotation(annotation)
        
        // Print the coordinates to the console
        print("Latitude: \(coordinate.latitude), Longitude: \(coordinate.longitude)")
    }
}
