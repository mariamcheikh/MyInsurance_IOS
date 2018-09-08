//
//  ConstatDetailsVC.swift
//  Assurance
//
//  Created by Mariam on 12/6/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class ConstatDetailsVC: UIViewController {

    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var lieu: UILabel!
    @IBOutlet weak var nomCondB: UILabel!
    @IBOutlet weak var prenomCondB: UILabel!
    @IBOutlet weak var marquevoitB: UILabel!
    @IBOutlet weak var immatB: UILabel!
    @IBOutlet weak var nomCondA: UILabel!
    @IBOutlet weak var prenomCondA: UILabel!
    @IBOutlet weak var marquevoitA: UILabel!
    @IBOutlet weak var immatVoiA: UILabel!
    
    
    
    var constat: AnyObject?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
       
        
        date.text = constat?["date"] as? String
        lieu.text = constat?["lieu"] as? String
        nomCondB.text = constat?["nomConducteur"] as? String
        prenomCondB.text = constat?["prenomConducteur"] as? String
        marquevoitB.text = constat?["marquevoiture"] as? String
        immatB.text = constat?["immatriculation"] as? String
        nomCondA.text = constat?["nomConducteurA"] as? String
        prenomCondA.text = constat?["prenomConducteurA"] as? String
        marquevoitA.text = constat?["marquevoitureA"] as? String
        immatVoiA.text = constat?["immatriculationA"] as? String
        
    
        
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
