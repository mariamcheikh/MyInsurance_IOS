//
//  DriverDetailsVC.swift
//  Assurance
//
//  Created by Mariam on 11/24/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire

class DriverDetailsVC: UIViewController {
    
    
    
    let URL_DRIVER_AFFECT = Constants.URL+"Register/v1/affecterDriver.php"

    
    @IBOutlet weak var labelMessage: UILabel!
    
    
    var driver : AnyObject?

    @IBAction func Cancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
   
    @IBOutlet weak var idDriver: UILabel!
    
    @IBOutlet weak var Nom: UILabel!
    
    
    @IBOutlet weak var prenom: UILabel!
    
  
    @IBOutlet var Ville: UILabel!
   
    
    @IBOutlet weak var phone: UILabel!
    
    
    @IBOutlet weak var cinuser: UITextField!
    
    @IBOutlet weak var marque: UILabel!
    
    
    
    @IBOutlet weak var model: UILabel!
    
    
    @IBOutlet weak var serie: UILabel!
    
    
    @IBOutlet weak var durée: UITextField!
    
    
    
    @IBAction func Affecter(_ sender: Any) {
        
        
        
        let parameters: Parameters=[
            "iddriver":idDriver.text!,
            "nom":Nom.text!,
            "prenom":prenom.text!,
            "phone":phone.text!,
            "marque":marque.text!,
            "model":model.text!,
            "serie":serie.text!,
            "ville":Ville.text!,
            "cinclient":cinuser.text!,
            "duree":durée.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_DRIVER_AFFECT, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
               //  let jsonData = result as!NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = "Success" as! String?
                }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         idDriver.text = driver?["id"] as? String
         Nom.text = driver?["fname"] as? String
         prenom.text = driver?["lname"] as? String
         phone.text = driver?["phone"] as? String
         marque.text = driver?["veh_mark"] as? String
         model.text = driver?["veh_model"] as? String
         serie.text = driver?["veh_number"] as? String
          Ville.text = driver?["ville"] as? String
        
        
        
        
        
        
        print(" id = \((driver?["id"])! ?? "vide")")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
