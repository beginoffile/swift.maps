//
//  HomeSwiftUI.swift
//  DemoMaps
//
//  Created by Aguid Ramirez Sanchez on 28/02/24.
//

import SwiftUI
import MapKit
import Combine

struct HomeSwiftUI: View {
    
    @StateObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1392), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    @State private var cancelable: AnyCancellable?
    
    func showLocation(){
        cancelable = locationManager.$locations.sink { (location) in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2000, longitudinalMeters: 2000)
        }
    }
    
    var body: some View {
        VStack{
//            Map(coordinateRegion: $region)
            var cameraPosition: MapCameraPosition {
            MapCameraPosition.region(region)
            }

            Map(position: .constant(cameraPosition), bounds: nil, interactionModes: .all,  scope: nil){
                UserAnnotation()
            }
            

        }.navigationTitle("Mapa SWIFTUI")
            .onAppear{
                showLocation()
            }
    }
}

#Preview {
    HomeSwiftUI()
}
