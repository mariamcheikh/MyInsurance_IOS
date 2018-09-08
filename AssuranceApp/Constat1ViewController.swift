//
//  Constat1ViewController.swift
//  Assurance
//
//  Created by Mariam on 11/29/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class Constat1ViewController: UIViewController {
    
     var vehiculB: VehiculeBViewController?
    
    var id: String!
    
    
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var heure: UITextField!
    @IBOutlet weak var lieu: UITextField!
    @IBOutlet weak var temoins: UITextField!
    @IBOutlet weak var blesse: UITextField!
    @IBOutlet weak var degat: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ConstatToVehiB" {
            
            self.vehiculB = segue.destination as? VehiculeBViewController
            
            let defaultValues = UserDefaults.standard
            id = defaultValues.string(forKey: "id") as! String
           
            self.vehiculB?.id = id
            self.vehiculB?.date = date.text
            self.vehiculB?.heure = heure.text
            self.vehiculB?.lieu = lieu.text
            self.vehiculB?.blesse = blesse.text
            self.vehiculB?.degat = degat.text
            self.vehiculB?.temoins = temoins.text
            
            
            
        }
    }
    
    
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    
    
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }


}
