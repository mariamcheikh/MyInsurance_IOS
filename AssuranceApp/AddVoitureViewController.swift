//
//  AddVoitureViewController.swift
//  AssuranceApp
//
//  Created by ESPRIT on 15/11/2017.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class AddVoitureViewController: UIViewController {

    
    /*let src = "http://localhost:8888/assurance/insererVoiture.php?ref="+lblRef.text!+"&marque="+lblMarque.text!+" &modele="+lblModele.text!
     let url1=URL(string: src.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
     self.save(url:url1!)*/
    
    func save(url:URL)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
