//
//  AjoutChauffeurViewController.swift
//  Assurance
//
//  Created by Mariam on 11/21/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire

class AjoutChauffeurViewController: UIViewController {
    
    
    let URL_SAVE_Driver = Constants.URL+"Register/v1/createDriver.php"

    @IBOutlet weak var textFieldNom: UITextField!
    
    @IBOutlet weak var textFieldPrenom: UITextField!
    
    @IBOutlet weak var textFieldPhone: UITextField!
    
    
    @IBOutlet weak var textFieldMarque: UITextField!
    
    
    @IBOutlet weak var textFieldModel: UITextField!
    
    
    @IBOutlet weak var textFieldNumber: UITextField!
    
    @IBOutlet weak var textFieldVille: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    
    @IBAction func AddDriver(_ sender: Any) {
    
        let parameters: Parameters=[
            "fname":textFieldNom.text!,
            "lname":textFieldPrenom.text!,
            "phone":textFieldPhone.text!,
            "veh_mark":textFieldMarque.text!,
            "veh_model":textFieldModel.text!,
            "veh_number":textFieldNumber.text!,
            "ville":textFieldVille.text!
            
        ]
        
        //Sending http post request
        Alamofire.request(URL_SAVE_Driver, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
