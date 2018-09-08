//
//  RegisterViewController.swift
//  Assurance
//
//  Created by Mariam on 11/14/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire


class RegisterViewController: UIViewController {
    
       let URL_USER_REGISTER = "http://localhost:8888/Register/v1/register.php"

    @IBOutlet weak var TextFieldUsername: UITextField!
    @IBOutlet weak var TextFieldPassword: UITextField!
    @IBOutlet weak var TextFieldEmail: UITextField!
    @IBOutlet weak var TextFieldName: UITextField!
    @IBOutlet weak var TextfiedPhone: UITextField!
    
    @IBOutlet weak var ncin: UITextField!
    @IBOutlet weak var dateNaiss: UIDatePicker!
    @IBOutlet weak var fname: UITextField!
  
    @IBOutlet weak var labelMessage: UILabel!
    
    
    
    
    @IBAction func buttonRegister(_ sender: Any) {
        
        dateNaiss.datePickerMode = UIDatePickerMode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let selectedDate = dateFormatter.string(from: dateNaiss.date)
        
        print("date naissnce= "+selectedDate)
        print("ncin= "+ncin.text!)
        
        let parameters: Parameters=[
         "username":TextFieldUsername.text!,
         "password":TextFieldPassword.text!,
         "name":TextFieldName.text!,
         "email":TextFieldEmail.text!,
         "phone":TextfiedPhone.text! ,
         "ncin":ncin.text!,
         "datenaiss":selectedDate,
         "fname":fname.text!
         ]
         
         //Sending http post request
         Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
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
    
    func updateFcm(url:URL)
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
