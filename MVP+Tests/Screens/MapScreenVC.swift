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
    
    var presenter: MapScreenPresenterProtocol?
    var coordinator: CoordinatorProtocol?
    
    var latitude: Double?
    var longitude: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        checkLocationServices()
        presenter?.getCoordinate()
    }
    
    private func configure() {
        mapView.setMapView(view: view, mapView: mapView)
    }
    
    // MARK: - SetUp Location staff
    // go to info.plist -> add new line -> add Privacy - Location When In Use Usage Description
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
            setLocationManager()
        } else {} // TODO: - create alert in the future
    }
    
    private func setLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
//    private func centerViewOnUserLocation() {
//        guard let location = locationManager.location?.coordinate else { return }
//        let region = MKCoordinateRegion(center: location, latitudinalMeters: Constants.zoom, longitudinalMeters: Constants.zoom)
//            mapView.setRegion(region, animated: true)
//    }
    
    private func userLocation() {
        if let latitude = latitude, let longitude = longitude {
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: center, latitudinalMeters: Constants.zoom, longitudinalMeters: Constants.zoom)
            mapView.setRegion(region, animated: true)
        }
    }

    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedWhenInUse:
            configureMapView()
        case .authorizedAlways:
            configureMapView()
        @unknown default:
            break
        }
    }
    
    private func configureMapView() {
        userLocation()
//        mapView.showsUserLocation = true
//        locationManager.startUpdatingLocation()
    }
}

extension MapScreenVC: MapScreenViewProtocol {
    func setCordinate(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension MapScreenVC: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: Constants.zoom, longitudinalMeters: Constants.zoom)
//        mapView.setRegion(region, animated: true)
//    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization() // check status if user change authorization
    }
}
