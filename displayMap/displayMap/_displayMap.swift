//
//  _displayMap.swift
//  displayMap
//
//  Created by raiu on 2019/11/01.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct _displayMap: UIViewRepresentable {
    
    func makeCoordinator() -> _displayMap.Coordinator {
        return _displayMap.Coordinator()
    }
    
    let map = MKMapView()
    let manager = CLLocationManager()
    
    func makeUIView(context: UIViewRepresentableContext<_displayMap>) -> MKMapView {
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        manager.requestAlwaysAuthorization()
        map.showsUserLocation = true
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<_displayMap>) {
        
    }
    
    
    class Coordinator : NSObject, CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .denied {
                print("denied")
            } else if status == .authorizedWhenInUse {
                print("authorizedWhenInUse")
            } else if status == .authorizedAlways {
                print("authorizedAlways")
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let last = locations.last
            print(last?.coordinate.latitude)
            print(last?.coordinate.longitude)
            
        }
    }
    
}

struct _displayMap_Previews: PreviewProvider {
    static var previews: some View {
        _displayMap()
    }
}
