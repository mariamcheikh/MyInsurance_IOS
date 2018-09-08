//
//  MapmViewController.swift
//  Assurance
//
//  Created by Mariam on 1/10/18.
//  Copyright © 2018 Mariam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapmViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var pickUpLat: Double! = 0.0
    var pickUpLng: Double! = 0.0
    
    
    
    let ceo: CLGeocoder = CLGeocoder()


    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        
       // print("langitude\(long,lati))
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
       pickUpLat = location.coordinate.latitude
        pickUpLng = location.coordinate.longitude
        var long: Float! = 0
        var lati: Float! = 0
        long = Float(pickUpLng)
        
        lati = Float(pickUpLat)

        print("langitude \(long!)")
        print("langitude2 \(pickUpLng!)")
        let pickUpLocation : CLLocation = CLLocation(latitude: pickUpLat, longitude: pickUpLng)
        
        ceo.reverseGeocodeLocation(pickUpLocation, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                // let pm = placemarks! as [CLPlacemark]
                let pm = placemarks
                
                if (pm?.count)! > 0 {
                    let pm = placemarks![0]
                    print("country \(pm.country!)")
                    print("locality \(pm.locality!)")
                    //  print(pm.subLocality!)
                    print("fare \(pm.subAdministrativeArea!)")
                    print("postal code \(pm.postalCode!)")
                    print("street \(pm.addressDictionary!)")
                    var addressString : String = ""
                    //// if pm.subLocality != nil {
                    //   addressString = addressString + pm.subLocality! + ", "
                    //  }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.subAdministrativeArea! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    
                   // self.pickupLocationSearch.text = addressString
                    
                    print("agoooooo : \(addressString)")
                }
        })
        
        
        mapView.setRegion(region, animated: true)
        
        
        
        self.mapView.showsUserLocation = true
        
        //save the new location to database
        
       /* let parameters: Parameters=[
            "iduser":16,
            "latitude":20,
            "longitude":20
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_LOCATION, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
        }
        
     */
    }


}












