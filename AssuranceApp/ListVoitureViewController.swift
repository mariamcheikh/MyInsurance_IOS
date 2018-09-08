//
//  ListVoitureViewController.swift
//  AssuranceApp
//
//  Created by ESPRIT on 15/11/2017.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class ListVoitureViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBAction func btnNv(_ sender: Any) {
    }
    
    var voitureList=[["","",""]]
    
    @IBOutlet weak var tablev: UITableView!
    
    
    func getAll()
    {
        let defaultValues = UserDefaults.standard
        let ncin : String=defaultValues.string(forKey: "userncin")!
        print("ncin====>"+ncin)
        let src:String=Constants.URL+"assurance/listvoiture.php?ncin="+ncin
        let url=URL(string: src)
        Alamofire.request(url!, method:.get).responseJSON{
            response in
            
            if(response.result.isSuccess){
                //print("success")
                
                if response.result.value != nil {
                //print(response.result.value)
                
                let voitures = response.result.value as! NSArray
                 //let main:Dictionary=dict["Optional"] as! Dictionary<String,AnyObject>
                 //print(dict)
                    self.voitureList.remove(at: 0)
                    var i=0
                    while(i < voitures.count)
                    {
                        let voiture:Dictionary=voitures[i] as! Dictionary<String,AnyObject>
                        let v=[voiture["marque"] as!String,voiture["modele"] as! String,voiture["immat"] as! String]
                        self.voitureList.append(v)
                        i=i+1
                    }
                    
                    
                    print(self.voitureList.count)
                    self.tablev.reloadData()
                }
                
            }
            else if (response.result.isFailure)
            {
                print("Failure")
            }
        }
    }
    
    func getInfo(url:URL) -> String
    {
        var resp : String = ""
        super.viewDidLoad()
        Alamofire.request(url, method:.post).responseJSON{
            response in
            print("before")
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                //if there is no error
                resp = jsonData.value(forKey: "res") as! String
                print("resp "+resp)
            }
            print("after")
        }
        return resp
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.voitureList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellValue", for: indexPath)
        
        //cell.textLabel?.text=self.voitureList[indexPath.row][0]+" "+self.voitureList[indexPath.row][1]
        let lbl1 = cell.contentView.viewWithTag(20) as! UILabel
        lbl1.text = self.voitureList[indexPath.row][0]
        let lbl2 = cell.contentView.viewWithTag(21) as! UILabel
        lbl2.text = self.voitureList[indexPath.row][1]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAll()
        
        let defaultValues = UserDefaults.standard
        let profession = defaultValues.string(forKey: "profession")
        let numP = defaultValues.string(forKey: "num_permis")
        
        self.navigationItem.rightBarButtonItem = nil
        
        if((profession == "")&&(numP == "/")){
            let btn1 = UIBarButtonItem(title: "Nv.", style: .plain, target: self, action: #selector(action1))
            self.navigationItem.rightBarButtonItem = btn1
        }else{
            let btn1 = UIBarButtonItem(title: "Nv.", style: .plain, target: self, action: #selector(action2))
            self.navigationItem.rightBarButtonItem = btn1
        }
    }
    
    func action1(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "infoPerso")
        self.navigationController?.show(vc!, sender: (Any).self)
    }
    
    func action2(){
        self.navigationItem.leftBarButtonItem = nil
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vehicule")
        self.navigationController?.show(vc!, sender: (Any).self)
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
