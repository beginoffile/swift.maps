//
//  PlacesSwiftUI.swift
//  DemoMaps
//
//  Created by Aguid Ramirez Sanchez on 29/02/24.
//

import SwiftUI
import MapKit

struct place: Identifiable{
    let id = UUID()
    let name : String
    let latitude: Double
    let longitud: Double
    var coordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitud)
    }
}

struct PlacesSwiftUI: View {
 
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PlacesSwiftUI()
}
