//
//  ListPayementTableViewController.swift
//  AssuranceApp
//
//  Created by ESPRIT on 16/11/2017.
//  Copyright © 2017 esprit. All rights reserved.
//

import UIKit
import Alamofire

class ListPayementTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let url=URL(string: Constants.URL+"assurance/listPayement.php")
    var payementList=[["",""]]
    
    @IBOutlet weak var tableVoiture: UITableView!
    
    func getAll()
    {
        // super.viewDidLoad()
        Alamofire.request(url!, method:.get).responseJSON{
            response in
            
            if(response.result.isSuccess){
                //print("success")
                
                if response.result.value != nil {
                    //print(response.result.value)
                    
                    let payements = response.result.value as! NSArray
                    //let main:Dictionary=dict["Optional"] as! Dictionary<String,AnyObject>
                    //print(dict)
                    self.payementList.remove(at: 0)
                    var i=0
                    while(i < payements.count)
                    {
                        let payement:Dictionary=payements[i] as! Dictionary<String,AnyObject>
                        let v=[payement["idPayement"] as!String,payement["date"] as! String]
                        self.payementList.append(v)
                        i=i+1
                    }
                    
                    
                    print(self.payementList.count)
                    self.tableVoiture.reloadData()
                }
                
            }
            else if (response.result.isFailure)
            {
                //print("Failure")
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.payementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellPayment", for: indexPath)
        
        cell.textLabel?.text=self.payementList[indexPath.row][0]+" "+self.payementList[indexPath.row][1]
        
        return cell

    }

    
}
