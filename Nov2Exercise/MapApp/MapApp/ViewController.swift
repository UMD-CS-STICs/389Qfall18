//
//  ViewController.swift
//  MapApp
//
//  Created by Tamer Bader on 11/2/18.
//  Copyright © 2018 TamerBader. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkLocationServicesEnabled() {
        // We will be checking if Location Services on device are enabled
    }
    
    func checkLocationAuth() {
        // Checking if the app has permission to get location
    }
    
    // Setup the Location Manager
    func setupLocationManager() {
    }
    
    func centerOnUserLocation() {
        // Take the users location and center into the region
    }
    
    

}


// Core Location Manager Delegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle User Location Updates
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Handle Auth Change
    }
}

