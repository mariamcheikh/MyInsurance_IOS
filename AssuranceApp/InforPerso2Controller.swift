//
//  InforPerso2Controller.swift
//  AssuranceApp
//
//  Created by Hamza FAIZA on 11/29/17.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class InforPerso2Controller: UIViewController {
    //let ncin : String="07206840"
    
    
    
    @IBOutlet weak var lblProfession: UITextField!
    @IBOutlet weak var lblAdresse: UITextField!
    @IBOutlet weak var lblVille: UITextField!
    @IBOutlet weak var lblCodePostal: UITextField!
    
    @IBAction func btnSave1(_ sender: Any) {
        
    }
    
    func action2()
    {
        var ncin : String=""
        let defaultValues = UserDefaults.standard
        if let n = defaultValues.string(forKey: "userncin"){
            ncin = n
        }
        let profesion : String = lblProfession.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let cp : String = lblCodePostal.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let ville : String = lblVille.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let adr : String = lblAdresse.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let src = Constants.URL+"assurance/updateInfosPersonnelles.php?ncin="+ncin+"&prof="+profesion+"&cp="+cp+"&ville="+ville+"&adr="+adr
        //src = src.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url1=URL(string: src)
        self.save(url:url1!)
        action1()
        //self.navigationItem.rightBarButtonItem = nil
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sv.", style: .plain, target: self, action : #selector(action1))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func action1(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Permis")
        self.navigationController?.show(vc!, sender: (Any).self)//(vc!, animated: true)//(permisController, sender: (Any).self)

    }
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



