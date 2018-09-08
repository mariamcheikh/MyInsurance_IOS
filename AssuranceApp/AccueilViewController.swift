//
//  AccueilViewController.swift
//  AssuranceApp
//
//  Created by Hamza FAIZA on 12/10/17.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class AccueilViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let backButton = UIBarButtonItem(title: "Se déconn.", style: UIBarButtonItemStyle.plain, target: navigationController, action: #selector(action))
        //navigationItem.leftBarButtonItem = backButton
        
        var ncin : String=""
        let defaultValues = UserDefaults.standard
        if let n = defaultValues.string(forKey: "userncin"){
            ncin = n
        }
        let token:String = InstanceID.instanceID().token()!
        //let ncin:String = "09652147"
        
        let src = "http://localhost:8888/assurance/addFCMTokens.php?fcm="+token+"&ncin="+ncin
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func action(){
        //removing values from default
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        //switching to login screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
