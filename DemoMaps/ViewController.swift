//
//  ViewController.swift
//  DemoMaps
//
//  Created by Aguid Ramirez Sanchez on 28/02/24.
//

import UIKit
import MapKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func segueSwiftUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: HomeSwiftUI())
    }
    
}

