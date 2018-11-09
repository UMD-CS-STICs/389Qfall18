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
    
    var locationManager: CLLocationManager = CLLocationManager()
    let regionDistance: Double = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServicesEnabled()
    }
    
    func checkLocationServicesEnabled() {
        // We will be checking if Location Services on device are enabled
        let isEnabled: Bool = CLLocationManager.locationServicesEnabled()
        if (isEnabled) {
            setupLocationManager()
            checkLocationAuth()
        } else {
            //
            print("Show Error")
        }
    }
    
    func checkLocationAuth() {
        let authStatus = CLLocationManager.authorizationStatus()
        
        switch authStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerOnUserLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        }
    }
    
    // Setup the Location Manager
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerOnUserLocation() {
        // Take the users location and center into the region
        
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegionMakeWithDistance(location, regionDistance, regionDistance)
            mapView.region = region
        }
    }
    
    

}


// Core Location Manager Delegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle User Location Updates
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Handle Auth Change
        
        switch status {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerOnUserLocation()
        default:
            print("Error")
            break
        }
        
        
    }
}

