//
//  ViewController.swift
//  drop1
//
//  Created by xc31a4 on 4/19/20.
//  Copyright © 2020 xc31a4. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{
    
    
    var locationManager = CLLocationManager()
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization ()
        
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Do any additional setup after loading the view.
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) /(locValue.longitude)")
        let userLocation = locations.last
        let viewRegion = MKCoordinateRegion(center: (userLocation?.coordinate)!, latitudinalMeters: 600, longitudinalMeters: 600)
        self.map.setRegion(viewRegion, animated: true)
    
        
        
        
        
    }


}

