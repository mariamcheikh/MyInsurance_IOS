//
//  DepannageViewController.swift
//  AssuranceApp
//
//  Created by ESPRIT on 17/11/2017.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import Firebase


class DepannageViewController: UIViewController, CLLocationManagerDelegate {

    var adminToken = ""
    let locationManager = CLLocationManager()
    var postion=CLLocationCoordinate2D()
    
    @IBOutlet weak var lblDescription: UITextView!
    
    
    @IBAction func btnReqDepannage(_ sender: Any) {
        
        
        
        
        let latitude:String = String(format:"%f", self.postion.latitude)
        let longitude:String = String(format:"%f", self.postion.longitude)
        
        let desc : String = lblDescription.text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let src: String = Constants.URL+"assurance/demanderSOS.php?longitude="+longitude+"&latitude="+latitude+"&description="+desc
        self.requestSOS(src:src)
        print(longitude)
        print(latitude)
        
        var token = Messaging.messaging().fcmToken
        print("message before "+token!)
        token = token?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        //let token = "d6lkHOtuc3s:APA91bGdZVFm9OqjdygqmnCy_FXeEI5gvpCl-6049fSPGOeSimhWLU9K7nZ3TJBfTYp3iBtixtmwGCKetS_6uO0h1dmWk6DaVpOgR_YB42gltT1u-mGCBYjdH1w5Ygq0Iu0YotMvSdqk"
        var message : String = "Nouvelle demande de depannage"
        message = message.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
       
        let srcAdmin = Constants.URL+"assurance/getAdminToken.php"
        Alamofire.request(URL(string: srcAdmin)!, method:.get).responseJSON{
            response in
            if(response.result.isSuccess){
                if response.result.value != nil {
                    print("success")
                    let lst = response.result.value as! NSArray
                    let lst1 = lst[0] as! NSDictionary
                    let lst2 = lst1["token"] as! NSDictionary
                    self.adminToken = lst2["token"] as! String
                    //print("tok "+self.adminToken)
                    print("admin token btn = "+self.adminToken)
                    let src2: String = Constants.URL+"assurance/sendpushnotification.php?message="+message+"&id="+self.adminToken
                    self.requestSOS(src:src2)
                }
                
            }
            else if (response.result.isFailure)
            {
                print("Failure")
            }
        }
        //////////
        
        
        dismiss(animated: true, completion: nil)
        //navigationController?.popToRootViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func requestSOS(src:String)
    {
        super.viewDidLoad()
        Alamofire.request(URL(string: src)!, method:.post).responseJSON{
            response in
            
            if(response.result.isSuccess){
                print("success1")
            }
            else if (response.result.isFailure)
            {
                print("success2")
            }
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.postion = location.coordinate
        }
    }
    
    /*func showLocationDisabledPopUp() {
     let alertController = UIAlertController(title: "Background Location Access Disabled",
     message: "In order to deliver pizza we need your location",
     preferredStyle: .alert)
     
     let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
     alertController.addAction(cancelAction)
     
     let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
     if let url = URL(string: UIApplicationOpenSettingsURLString) {
     UIApplication.shared.open(url, options: [:], completionHandler: nil)
     }
     }
     alertController.addAction(openAction)
     
     self.present(alertController, animated: true, completion: nil)
     }*/


}
