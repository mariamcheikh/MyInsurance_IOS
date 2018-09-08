//
//  DisplayConstatViewController.swift
//  Assurance
//
//  Created by Mariam on 12/6/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire

class DisplayConstatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TableConstat: UITableView!
    var ConstatArray: [AnyObject] = []
     let url = URL(string: Constants.URL+"Register/v1/displayConstat.php")

    func affichage()
    {
        
        Alamofire.request(url!, method:.post).responseJSON{
            response in
            
            if(response.result.isSuccess){
                print("success")
                
                if response.result.value != nil {
                    
                    self.ConstatArray = response.result.value as! [AnyObject]
                    
                    print(self.ConstatArray)
                    self.TableConstat.reloadData()
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
        return ConstatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  CustomConstatTableViewCell
        
        let date = ConstatArray[indexPath.row]["date"]
        let lieu = ConstatArray[indexPath.row]["lieu"]
        let nomConducteur = ConstatArray[indexPath.row]["nomConducteur"]
        let prenomConducteur = ConstatArray[indexPath.row]["prenomConducteur"]
        let marquevoiture = ConstatArray[indexPath.row]["marquevoiture"]
        let immatriculation = ConstatArray[indexPath.row]["immatriculation"]
        let nomConducteurA = ConstatArray[indexPath.row]["nomConducteurA"]
        let prenomConducteurA = ConstatArray[indexPath.row]["prenomConducteurA"]
        let marquevoitureA = ConstatArray[indexPath.row]["marquevoitureA"]
        let immatriculationA = ConstatArray[indexPath.row]["immatriculationA"]
        
    
        cell?.labeldate.text = date as? String
        cell?.labellieu.text = lieu as? String
        cell?.labelnomConducB.text = nomConducteur as? String
        cell?.labelprenomconductB.text = prenomConducteur as? String
        cell?.labelmarqueB.text = marquevoiture as? String
        cell?.labelimmatB.text = immatriculation as? String
        cell?.labelnomConducA.text = nomConducteurA as? String
        
       
        cell?.labelprenomConductA.text = prenomConducteurA as? String
        cell?.labelmarqueA.text = marquevoitureA as? String
        cell?.labelimatA.text = immatriculationA as? String
     
        
        return cell!
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         affichage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showConstatSegue" {
            let details = segue.destination as! ConstatDetailsVC
            details.constat = ConstatArray[(TableConstat.indexPathForSelectedRow?.row)!]
        }
    }
}
