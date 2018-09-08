//
//  DisplayDriversViewController.swift
//  Assurance
//
//  Created by Mariam on 11/23/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire

class DisplayDriversViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
       let url = URL(string: Constants.URL+"Register/v1/listDrivers.php")
    

    @IBOutlet weak var TableDrivers: UITableView!
    var driversArray: [AnyObject] = []
    
    func affichage()
    {
        
        Alamofire.request(url!, method:.post).responseJSON{
            response in
           
            if(response.result.isSuccess){
                print("success")
                
                if response.result.value != nil {
                    
                    self.driversArray = response.result.value as! [AnyObject]
                    
                   print(self.driversArray)
                    self.TableDrivers.reloadData()
                                                    }
            }
            else if (response.result.isFailure)
            {
                print("Failure")
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driversArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  CustomDriversTableViewCell
        
        let id = driversArray[indexPath.row]["id"]
        let name = driversArray[indexPath.row]["lname"]
        let phone = driversArray[indexPath.row]["phone"]
        let prenom = driversArray[indexPath.row]["fname"]
        let marque = driversArray[indexPath.row]["veh_mark"]
        let modele = driversArray[indexPath.row]["veh_model"]
        let serie = driversArray[indexPath.row]["veh_number"]
        let Ville = driversArray[indexPath.row]["ville"]
        
        cell?.id.text = id as? String
        cell?.Name.text = name as? String
        cell?.Prenom.text = prenom as? String
        cell?.phone.text = phone as? String
        cell?.Marque.text = marque as? String
        cell?.Model.text = modele as? String
        cell?.serie.text = serie as? String
       cell?.Ville.text = Ville as? String
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
         affichage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showdriverSegue" {
         let details = segue.destination as! DriverDetailsVC
            details.driver = driversArray[(TableDrivers.indexPathForSelectedRow?.row)!]
        }
    }
}
