//
//  VehiculeBViewController.swift
//  Assurance
//
//  Created by Mariam on 11/28/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class VehiculeBViewController: UIViewController {
    
    @IBOutlet weak var BVehiasurepar: UITextField!
    @IBOutlet weak var BContratAssurance: UITextField!
    @IBOutlet weak var BVehiAgence: UITextField!
    @IBOutlet weak var BValabledu: UITextField!
    @IBOutlet weak var Bvalableau: UITextField!
    @IBOutlet weak var BnomConducteur: UITextField!
    @IBOutlet weak var BprenomConducteur: UITextField!
    @IBOutlet weak var BaddresseConducteur: UITextField!
    @IBOutlet weak var BpermisConducteur: UITextField!
    @IBOutlet weak var Bdelivrele: UITextField!
    @IBOutlet weak var Bnomassure: UITextField!
    @IBOutlet weak var Bprenomassure: UITextField!
    @IBOutlet weak var Baddresseassure: UITextField!
    @IBOutlet weak var telassure: UITextField!
    @IBOutlet weak var Bmarque: UITextField!
    @IBOutlet weak var Bimmatricul: UITextField!
    @IBOutlet weak var BsensSuivis: UITextField!
    @IBOutlet weak var Bvenantde: UITextField!
    @IBOutlet weak var Ballanta: UITextField!
    @IBOutlet weak var Bdegatapparents: UITextField!
    @IBOutlet weak var BObservation: UITextField!
    
    
    ///////////// les données de la 1er interfaces (Constat)//////////
    
    var id: String!
    var date: String!
    var heure: String!
    var lieu: String!
    var blesse: String!
    var degat: String!
    var temoins: String!
    
    
    
    //////////////////////////////Les Donnes de la 2eme interfaces/////////////////////////////////
     var circonstanceB: CirconstanceVehiculeBViewController?
    
    ///////////////////////////////////////////////////////////////////////////////////////

    @IBOutlet weak var ScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1500)

        print(id,date,heure,lieu,blesse,degat,temoins)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VehiBtoCirconstanceB" {
            self.circonstanceB = segue.destination as? CirconstanceVehiculeBViewController
            self.circonstanceB?.id = id
          self.circonstanceB?.date = date
          self.circonstanceB?.heure = heure
            self.circonstanceB?.lieu = lieu
            self.circonstanceB?.blesse = blesse
            self.circonstanceB?.degat = degat
            self.circonstanceB?.temoins = temoins
            
            self.circonstanceB?.Bvehiassurepar = BVehiasurepar.text
            self.circonstanceB?.Bcontratassu = BContratAssurance.text
            self.circonstanceB?.Bassuraagence = BVehiAgence.text
            self.circonstanceB?.Bvalabledu = BValabledu.text
           self.circonstanceB?.Bvalableau = Bvalableau.text
           self.circonstanceB?.BnomConducteur = BnomConducteur.text
            
            self.circonstanceB?.BprenomConducteur = BprenomConducteur.text
            self.circonstanceB?.Baddresseconducteur = BaddresseConducteur.text
            self.circonstanceB?.BpermisConducteur = BpermisConducteur.text
            self.circonstanceB?.Bdelivrele = Bdelivrele.text
            self.circonstanceB?.Bnomassureur = Bnomassure.text
            
            self.circonstanceB?.Bprenomassureur = Bprenomassure.text
            self.circonstanceB?.Baddresseassureur = Baddresseassure.text
            
            self.circonstanceB?.Btelassureur = telassure.text
            
            self.circonstanceB?.Bmarque = Bmarque.text
            self.circonstanceB?.BNumimmatri = Bimmatricul.text
            self.circonstanceB?.Bsenssuivis = BsensSuivis.text

            self.circonstanceB?.Bvenantde = Bvenantde.text
            self.circonstanceB?.Ballanta = Ballanta.text
            self.circonstanceB?.Bdegat = Bdegatapparents.text
            self.circonstanceB?.Bobservation = BObservation.text
    
            
            
        }
    }

    

}
