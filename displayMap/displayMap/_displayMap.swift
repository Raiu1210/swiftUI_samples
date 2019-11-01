//
//  _displayMap.swift
//  displayMap
//
//  Created by raiu on 2019/11/01.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI
import MapKit

struct _displayMap: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    func makeUIView(context: UIViewRepresentableContext<_displayMap>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<_displayMap>) {
        let coordinate = CLLocationCoordinate2D(latitude: 37.3351, longitude: -122.0088)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
}

struct _displayMap_Previews: PreviewProvider {
    static var previews: some View {
        _displayMap()
    }
}
