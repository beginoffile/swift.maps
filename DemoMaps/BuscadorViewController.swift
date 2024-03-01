//
//  BuscadorViewController.swift
//  DemoMaps
//
//  Created by Aguid Ramirez Sanchez on 29/02/24.
//

import UIKit
import MapKit

class BuscadorViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var buscar: UISearchBar!
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        buscar.resignFirstResponder()
        guard let buscador = buscar.text else {return}
        let geocode = CLGeocoder()
        geocode.geocodeAddressString(buscador) { (places:[CLPlacemark]?, error) in
            if error == nil{
                let place = places?.first
                let anotation = MKPointAnnotation()
                anotation.coordinate = (place?.location?.coordinate)!
                anotation.title = buscador
                let region = MKCoordinateRegion(center: anotation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                self.mapa.setRegion(region, animated: true)
                self.mapa.addAnnotation(anotation)
                self.mapa.selectAnnotation(anotation, animated: true)
            }else{
                print("Ubicacion no encontrada")
            }
        }
        
    }
    

    

}
