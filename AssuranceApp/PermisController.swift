//
//  PermisController.swift
//  AssuranceApp
//
//  Created by Hamza FAIZA on 11/29/17.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class PermisController: UIViewController {
    ///let ncin : String = "07206840"
    
    @IBOutlet weak var lblNumPermis1: UITextField!
    @IBOutlet weak var lblNumPermis2: UITextField!
    @IBOutlet weak var lblDatePermis: UIDatePicker!
    @IBAction func btnSavePermis(_ sender: Any) {
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func action1(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vehicule")
        self.navigationController?.show(vc!, sender: (Any).self)//(vc!, animated: true)//(permisController, sender: (Any).self)
        
    }
    
    func action2()
    {
        var ncin : String=""
        let defaultValues = UserDefaults.standard
        if let n = defaultValues.string(forKey: "userncin"){
            ncin = n
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let selectedDate = dateFormatter.string(from: lblDatePermis.date)
        
        var num : String = lblNumPermis1.text!+"/"+lblNumPermis2.text!
        num = num.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let src = Constants.URL+"assurance/AddPermis.php?ncin="+ncin+"&datep="+selectedDate+"&num="+num
        //src = src.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url1=URL(string: src)
        self.save(url:url1!)
        action1()
        //self.navigationItem.rightBarButtonItem = nil
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sv.", style: .plain, target: self, action : #selector(action1))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
