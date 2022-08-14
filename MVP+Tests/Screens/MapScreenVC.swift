//
//  MapScreenVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapScreenVC: UIViewController {
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        checkLocationServices()
    }
    
    private func configure() {
        mapView.setMapView(view: view, mapView: mapView)
    }
    
    // MARK: - SetUp Location staff
    // go to info.plist -> add new line -> add Privacy - Location When In Use Usage Description
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setLocationManager()
            checkLocationAuthorization()
        } else {
            // show Error alert
        }
    }
    
    private func setLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
}

extension MapScreenVC: CLLocationManagerDelegate {
    
}
