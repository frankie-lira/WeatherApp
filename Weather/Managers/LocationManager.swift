//
//  LocationManager.swift
//  Weather
//
//  Created by Francisco Lira on 2/1/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate { //had to include three protocols
    let manager = CLLocationManager() //new instantce of  location manager
    
    @Published var location: CLLocationCoordinate2D? //its optional since user may not grant access
    @Published var isLoading = false
    
    override init() { //when our class is initialize we have to call this
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //
        location = locations.first?.coordinate //
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}

