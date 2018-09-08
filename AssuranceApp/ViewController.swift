//
//  ViewController.swift
//  Assurance
//
//  Created by Mariam on 11/14/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire 

class ViewController: UIViewController {
    
      let URL_USER_LOGIN = "http://localhost:8888/Register/v1/login.php"
    
      let defaultValues = UserDefaults.standard

    @IBOutlet weak var textFieldUsername: UITextField!
    
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var labelMessage: UILabel!
    
   
    @IBAction func buttonLogin(_ sender: Any) {
        
        
        //getting the username and password
        let parameters: Parameters=[
            "username":textFieldUsername.text!,
            "password":textFieldPassword.text!
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "subscriber") as! NSDictionary
                        
                        //getting user values
                        //let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userPhone = user.value(forKey: "phone") as! String
                        let lname = user.value(forKey: "lname") as! String
                        let fname = user.value(forKey: "fname") as! String
                        let userNcin = user.value(forKey: "ncin") as! String
                        //let userBirthDate = user.value(forKey: "birthdate") as! String
                        
                        //saving user values to defaults
                        //self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userPhone, forKey: "userphone")
                        self.defaultValues.set(userNcin, forKey: "userncin")
                        self.defaultValues.set(fname, forKey: "userfname")
                        self.defaultValues.set(lname, forKey: "userlname")
                        
                        /*let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewController
                        self.navigationController?.pushViewController(profileViewController, animated: true)*/
                        
                        let accueilController = self.storyboard?.instantiateViewController(withIdentifier: "accueil") as! AccueilViewController
                        self.navigationController?.present(accueilController, animated: true)
                        //self.navigationController.top
                        
                        //self.dismiss(animated: false, completion: nil)
                    }else{
                        //error message in case of invalid credential
                        self.labelMessage.text = "Pseudo ou mot de passe incorrecte"
                    }
                }
        }
    }

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hiding the navigation button
        //let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        //navigationItem.leftBarButtonItem = backButton
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //if user is already logged in switching to profile screen
        if defaultValues.string(forKey: "username") != nil{
            /*let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewController
            self.navigationController?.pushViewController(profileViewController, animated: true)*/
            let accueilController = self.storyboard?.instantiateViewController(withIdentifier: "accueil") as! AccueilViewController
            self.navigationController?.pushViewController(accueilController, animated: true)
            
        }
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

