//
//  WarrantyController.swift
//  AssuranceApp
//
//  Created by Hamza FAIZA on 11/29/17.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class WarrantyController: UIViewController {
    
    
    @IBOutlet weak var assurDem: UISegmentedControl!
    @IBOutlet weak var opt1: UISwitch!
    @IBOutlet weak var opt2: UISwitch!
    @IBOutlet weak var opt3: UISwitch!
    @IBOutlet weak var opt4: UISwitch!
    @IBOutlet weak var opt5: UISwitch!
    @IBOutlet weak var opt6: UISwitch!
    @IBOutlet weak var opt7: UISwitch!
    @IBAction func btnWarranty(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = nil
        let btn1 = UIBarButtonItem(title: "Sv.", style: .plain, target: self, action: #selector(action2))
        self.navigationItem.rightBarButtonItem = btn1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func action2()
    {
        var ncin : String=""
        let defaultValues = UserDefaults.standard
        if let n = defaultValues.string(forKey: "userncin"){
            ncin = n
        }
        
        let type  : String = assurDem.titleForSegment(at: assurDem.selectedSegmentIndex)!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        var optVal1 : String="0"
        if(opt1.isOn){
            optVal1 = "1"
        }
        var optVal2 : String="0"
        if(opt2.isOn){
            optVal2 = "1"
        }
        var optVal3 : String="0"
        if(opt3.isOn){
            optVal3 = "1"
        }
        var optVal4 : String="0"
        if(opt4.isOn){
            optVal4 = "1"
        }
        var optVal5 : String="0"
        if(opt5.isOn){
            optVal5 = "1"
        }
        var optVal6 : String="0"
        if(opt6.isOn){
            optVal6 = "1"
        }
        var optVal7 : String="0"
        if(opt7.isOn){
            optVal7 = "1"
        }
        var idvehi : String = ""
        if let idv = defaultValues.string(forKey: "idVeh"){
            idvehi = idv
        }else{
            
        }
        
        let src = Constants.URL+"assurance/warranty.php?ncin="+ncin+"&type="+type+"&resp="+optVal1+"&defen="+optVal2+"&vol="+optVal3+"&incen="+optVal4+"&remor="+optVal5+"&glace="+optVal6+"&secur="+optVal7+"&idveh="+idvehi
        let url1=URL(string: src)
        self.save(url:url1!)
        
        //self.navigationItem.rightBarButtonItem = nil
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sv.", style: .plain, target: self, action : #selector(action1))
        action1()

    }
    
    func action1(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Terme")
        self.navigationController?.show(vc!, sender: (Any).self)
        
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
        
        //if(segue.identifier=="SegFinal"){
            let dest=segue.destination as! TermeController
            dest.idVeh=idVehi
        //}
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
