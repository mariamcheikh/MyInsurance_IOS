//
//  ViewController.swift
//  AssuranceApp
//
//  Created by ESPRIT on 15/11/2017.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class ViewController2: UIViewController {
    
    

    @IBAction func btnAssureur(_ sender: Any) {
        let token:String = InstanceID.instanceID().token()!
        print("TOKEN: "+token)
        let ncin:String = "07856214"
        
        let src = Constants.URL+"assurance/addFCMTokens.php?fcm="+token+"&ncin="+ncin
        let url1=URL(string: src)
        self.updateFcm(url:url1!)
    }
    
    @IBAction func btnAbonne(_ sender: Any) {
        let token:String = InstanceID.instanceID().token()!
        let ncin:String = "09652147"
        
        let src = Constants.URL+"assurance/addFCMTokens.php?fcm="+token+"&ncin="+ncin
        let url1=URL(string: src)
        self.updateFcm(url:url1!)
    }
    
    
    
    func updateFcm(url:URL)
    {
        super.viewDidLoad()
        Alamofire.request(url, method:.post).responseJSON{
            response in
            
            if(response.result.isSuccess){
                print("success")
            }
            else if (response.result.isFailure)
            {
                print("Failure")
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

