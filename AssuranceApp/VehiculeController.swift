//
//  VehiculeController.swift
//  AssuranceApp
//
//  Created by Hamza FAIZA on 11/29/17.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class VehiculeController: UIViewController {

        let defaultValues = UserDefaults.standard

    
    @IBOutlet weak var energie: UISegmentedControl!
    @IBOutlet weak var marque: UITextField!
    @IBOutlet weak var modele: UITextField!
    @IBOutlet weak var nbreCV: UITextField!
    @IBOutlet weak var immat1: UITextField!
    @IBOutlet weak var immat2: UITextField!
    
    @IBOutlet weak var numSerie: UITextField!
    @IBOutlet weak var dateCirculation: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = nil
        let btn1 = UIBarButtonItem(title: "Suiv.", style: .plain, target: self, action: #selector(action2))
        //btn1.tintColor=UIColor.green
        self.navigationItem.rightBarButtonItem = btn1
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func action1(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Warranty")
        self.navigationController?.show(vc!, sender: (Any).self)//(vc!, animated: true)//(permisController, sender: (Any).self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func action2()
    {
        
        var ncin : String=""
        let defaultValues = UserDefaults.standard
        if let n = defaultValues.string(forKey: "userncin"){
            ncin = n
        }
        
        var immat : String = immat1.text!+" TUN "+immat2.text!
        immat=immat.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let selectedDate = dateFormatter.string(from: dateCirculation.date)
        let numS = numSerie.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let mark = marque.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let model = modele.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let nbCh = nbreCV.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let energ = energie.titleForSegment(at: energie.selectedSegmentIndex)!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
         let src = Constants.URL+"assurance/insererVoiture.php?ncin="+ncin+"&num="+numS+"&marque="+mark+"&modele="+model+"&dcirc="+selectedDate+"&cv="+nbCh+"&immat="+immat+"&energie="+energ
        //src = src.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

         let url1=URL(string: src)
         self.save(url:url1!)
        
        self.defaultValues.set(numSerie.text!, forKey: "idVeh")
        action1()
        }
    
    func save(url:URL)
    {
        super.viewDidLoad()
        Alamofire.request(url, method:.post).responseJSON{
            response in
            if(response.result.isSuccess){
                print("success1")
            }
            else if (response.result.isFailure)
            {
                print("success2")
            }
        }
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegWarr" {
            let dest=segue.destination as! WarrantyController
            dest.idVehi="123";
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
