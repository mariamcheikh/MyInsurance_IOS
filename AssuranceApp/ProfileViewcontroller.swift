//
//  ProfileViewController.swift
//  XcodeLoginExample
//
//  Created by Belal Khan on 01/06/17.
//  Copyright © 2017 Belal Khan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var labelUserName: UILabel!
    
   
    
    @IBAction func buttonLogout(_ sender: Any) {
        
        
        //removing values from default
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        //switching to login screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hiding back button
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //getting user data from defaults
        let defaultValues = UserDefaults.standard
        if let name = defaultValues.string(forKey: "username"){
            //setting the name to label
            labelUserName.text = name
            //labelEmail.text = phone
        }else{
            //send back to login view controller
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
