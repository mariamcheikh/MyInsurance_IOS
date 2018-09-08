//
//  PayerViewController.swift
//  AssuranceApp
//
//  Created by ESPRIT on 15/11/2017.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class PayerViewController: UIViewController {

    @IBOutlet weak var mois: UITextField!
    @IBOutlet weak var annee: UITextField!
    @IBOutlet weak var idCarte: UITextField!
    @IBOutlet weak var codeCarte: UITextField!
    
    @IBAction func btnPayer(_ sender: Any) {
        
        let dateoFormat=DateFormatter()
        dateoFormat.dateFormat = "dd/MM/yyyy"
        let timeString:String = dateoFormat.string(from: Date() as Date)
        
        let src = "http://localhost:8888/assurance/payer.php?idcarte="+idCarte.text!+"&mois="+mois.text!+"&annee="+annee.text!+"&code="+codeCarte.text!+"&date="+timeString
        
        print(timeString)
        
        let url1=URL(string: src.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
        self.registrer(url:url1!)
        dismiss(animated: true, completion: nil)
    }
    
    func registrer(url:URL)
    {
        super.viewDidLoad()
        Alamofire.request(url, method:.post).responseJSON{
            response in
            
            if(response.result.isSuccess){
                print("success")
            }
            else if (response.result.isFailure)
            {
                //print("Failure")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
