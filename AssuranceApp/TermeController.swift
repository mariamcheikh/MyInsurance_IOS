//
//  TermeController.swift
//  AssuranceApp
//
//  Created by Hamza FAIZA on 11/30/17.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class TermeController: UIViewController {
    

    @IBAction func btnAccept(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnRefus(_ sender: Any) {
    }
    
    func delete(url:URL)
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
        let defaultValues = UserDefaults.standard
        if let idv = defaultValues.string(forKey: "idVeh"){
            let src = Constants.URL+"assurance/deleteVehWarr.php?idveh="+idv
            let url1=URL(string: src)
            self.delete(url:url1!)
            defaultValues.removeSuite(named: "idVeh")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        let btn1 = UIBarButtonItem(title: "Refuser", style: .plain, target: self, action: #selector(action1))
        btn1.tintColor=UIColor.red
        self.navigationItem.leftBarButtonItem = btn1
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
