//
//  CirconstanceVehiculeBViewController.swift
//  Assurance
//
//  Created by Mariam on 11/28/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class CirconstanceVehiculeBViewController: UIViewController {
    
       var tovehiA: VehiculeAViewController?

    @IBOutlet weak var scrollviewVehi: UIScrollView!
    @IBOutlet weak var enstationnement: UISwitch!
    @IBOutlet weak var quitstationnement: UISwitch!
    
    
    @IBOutlet weak var prenantstationnement: UISwitch!
    @IBOutlet weak var sortantparking: UISwitch!
    @IBOutlet weak var sengageantParking: UISwitch!
    @IBOutlet weak var arretCirculation: UISwitch!
    @IBOutlet weak var frottement: UISwitch!
    @IBOutlet weak var heurtaitarriere: UISwitch!
    @IBOutlet weak var roulaitarriere: UISwitch!
    @IBOutlet weak var changeantfile: UISwitch!
    @IBOutlet weak var doublait: UISwitch!
    @IBOutlet weak var viraitdroite: UISwitch!
    @IBOutlet weak var viraitgauche: UISwitch!
    @IBOutlet weak var reculait: UISwitch!
    @IBOutlet weak var senpeite: UISwitch!
 
    @IBOutlet weak var venaitdedroite: UISwitch!
    @IBOutlet weak var observaitsignal: UISwitch!
    

     var id: String!
    var date: String!
    var heure: String!
    var lieu: String!
    var blesse: String!
    var degat: String!
    var temoins: String!
    var Bvehiassurepar: String!
    var Bcontratassu: String!
    var Bassuraagence: String!
    var Bvalabledu: String!
    var Bvalableau: String!
    var BnomConducteur: String!
    var BprenomConducteur: String!
    var Baddresseconducteur: String!
    var BpermisConducteur: String!
    var Bdelivrele: String!
    var Bnomassureur: String!
    var Bprenomassureur: String!
    var Baddresseassureur: String!
    var Btelassureur: String!
    var Bmarque: String!
    var BNumimmatri: String!
    var Bsenssuivis: String!
    var Bvenantde: String!
    var Ballanta: String!
    var Bdegat: String!
    var Bobservation: String!
    

    var stationnement: String! = "NON"
    var stationnement2: String!  = "NON"
    var stationnement3: String! = "NON"
    var parking: String! = "NON"
    var parking2: String! = "NON"
    var circulation: String! = "NON"
    var frotement: String! = "NON"
    var heurtaitarrieree: String! = "NON"
    var roulaitarrieree: String! = "NON"
    var changfil: String! = "NON"
    var doubler: String! = "NON"
    var virerdroite: String! = "NON"
    var virergauche: String! = "NON"
    var reculer: String! = "NON"
    var enpieter: String! = "NON"
    var venerdroite: String! = "NON"
    var observesignal: String! = "NON"
 
    
    
    
    @IBAction func onStationement(_ sender: Any) {
        
        if enstationnement.isOn {
            print("true yey")
            stationnement = "OUI"
        } else {
            print("oups")
            stationnement = "NON"
        }

    }
   
    
    @IBAction func Onquitstationnement(_ sender: Any) {
    
        let state : Bool = quitstationnement.isOn
        if state == true {
            print("yey")
            stationnement2 = "OUI"
        } else {
            print("no")
            stationnement2 = "NON"
        }
        
    }
    
    
    @IBAction func Onprenantstationnement(_ sender: Any) {
        
        let state : Bool = prenantstationnement.isOn
        if state == true {
            print("yey")
            stationnement3 = "OUI"
        } else {
            print("oups")
            stationnement3 = "NON"
        }
        
    }
    
    
    @IBAction func OnParking2(_ sender: Any) {
        
        let state : Bool = sengageantParking.isOn
        if state == true {
            print("yey")
            parking2 = "OUI"
        } else {
            print("oups")
            parking2 = "NON"
        }
   
        
    }
    
    
    @IBAction func OnCirculation(_ sender: Any) {
        
        let state : Bool = arretCirculation.isOn
        if state == true {
            print("yey")
            circulation = "OUI"
        } else {
            print("oups")
            circulation = "NON"
        }
        
    }
    
    @IBAction func OnFrottement(_ sender: Any) {
        let state : Bool = frottement.isOn
        if state == true {
            print("yey")
            frotement = "OUI"
        } else {
            print("oups")
            frotement = "NON"
        }
        
    }
    
    @IBAction func OnHeurtaitarrieree(_ sender: Any) {
        
        let state : Bool = heurtaitarriere.isOn
        if state == true {
            print("yey")
            heurtaitarrieree = "OUI"
        } else {
            print("oups")
            heurtaitarrieree = "NON"
        }
    }
    
    
    
    
    
    @IBAction func OnRoulaitarrieree(_ sender: Any) {
        
        let state : Bool = roulaitarriere.isOn
        if state == true {
            print("yey")
            roulaitarrieree = "OUI"
        } else {
            print("oups")
            roulaitarrieree = "NON"
        }
    }
    
    
    
    @IBAction func OnChangfil(_ sender: Any) {
        let state : Bool = changeantfile.isOn
        if state == true {
            print("yey")
            changfil = "OUI"
        } else {
            print("oups")
            changfil = "NON"
        }
        
    }
    
    
    
    
    @IBAction func OnDoubler(_ sender: Any) {
        
        let state : Bool = doublait.isOn
        if state == true {
            print("yey")
            doubler = "OUI"
        } else {
            print("oups")
            doubler = "NON"
        }

    }

    
    
    @IBAction func OnVirerdroite(_ sender: Any) {
        let state : Bool = viraitdroite.isOn
        if state == true {
            print("yey")
            virerdroite = "OUI"
        } else {
            print("oups")
            virerdroite = "NON"
        }
        
    }
    
    
    
    @IBAction func OnViraitgauche(_ sender: Any) {
        let state : Bool = viraitgauche.isOn
        if state == true {
            print("yey")
            virergauche = "OUI"
        } else {
            print("oups")
            virergauche = "NON"
        }
        
    }
    
    
    @IBAction func OnReculer(_ sender: Any) {
        
        let state : Bool = reculait.isOn
        if state == true {
            print("yey")
            reculer = "OUI"
        } else {
            print("oups")
            reculer = "NON"
        }

        
    }
    
    @IBAction func OnSenpeite(_ sender: Any) {
        let state : Bool = senpeite.isOn
        if state == true {
            print("yey")
            enpieter = "OUI"
        } else {
            print("oups")
            enpieter = "NON"
        }
        
    }
    
    
    
    
    @IBAction func Onvenaitdedroite(_ sender: Any) {
        
        let state : Bool = venaitdedroite.isOn
        if state == true {
            print("yey")
            venerdroite = "OUI"
        } else {
            print("oups")
            venerdroite = "NON"
        }
        
        
    }
    
    
    
    @IBAction func OnObservesignal(_ sender: Any) {
        
        let state : Bool = observaitsignal.isOn
        if state == true {
            print("yey")
            observesignal = "OUI"
        } else {
            print("oups")
            observesignal = "NON"
        }

    }
    
    
    
    
    
    @IBAction func OnParking(_ sender: Any) {
    let state : Bool = sortantparking.isOn
        if state == true {
            print("yey")
            parking = "OUI"
        } else {
            print("oups")
            parking = "NON"
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        scrollviewVehi.contentSize = CGSize(width: self.view.frame.width, height: 1500)
        
        print(id,date,heure,lieu,blesse,degat,temoins,Bvehiassurepar,Bcontratassu,Bassuraagence,Bvalableau,Bvalabledu,BnomConducteur,BprenomConducteur,Baddresseconducteur,BpermisConducteur,Bdelivrele,Bnomassureur,Bprenomassureur,Baddresseassureur,Btelassureur,Bmarque,BNumimmatri,Bsenssuivis,Bvenantde,Ballanta,Bdegat,Bobservation)
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
  
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toVehiA" {
            
            self.tovehiA = segue.destination as? VehiculeAViewController
            self.tovehiA?.id = id
            self.tovehiA?.date = date
            self.tovehiA?.heure = heure
            self.tovehiA?.lieu = lieu
            self.tovehiA?.blesse = blesse
            self.tovehiA?.degat = degat
            self.tovehiA?.temoins = temoins
            self.tovehiA?.Bvehiassurepar = Bvehiassurepar
            self.tovehiA?.Bcontratassu = Bcontratassu
            self.tovehiA?.Bassuraagence = Bassuraagence
            self.tovehiA?.Bvalabledu = Bvalabledu
            self.tovehiA?.Bvalableau = Bvalableau
            self.tovehiA?.BnomConducteur = BnomConducteur
            
            self.tovehiA?.BprenomConducteur = BprenomConducteur
            self.tovehiA?.Baddresseconducteur = Baddresseconducteur
            self.tovehiA?.BpermisConducteur = BpermisConducteur
            self.tovehiA?.Bdelivrele = Bdelivrele
            self.tovehiA?.Bnomassureur = Bnomassureur
            
            self.tovehiA?.Bprenomassureur = Bprenomassureur
            self.tovehiA?.Baddresseassureur = Baddresseassureur
            self.tovehiA?.Btelassureur = Btelassureur
            self.tovehiA?.Bmarque = Bmarque
            self.tovehiA?.BNumimmatri = BNumimmatri
            self.tovehiA?.Bsenssuivis = Bsenssuivis
            
            self.tovehiA?.Bvenantde = Bvenantde
            self.tovehiA?.Ballanta = Ballanta
            self.tovehiA?.Bdegat = Bdegat
            self.tovehiA?.Bobservation = Bobservation
            
            
            self.tovehiA?.Enstationnement = stationnement
            self.tovehiA?.Enstationnement1 = stationnement2
            self.tovehiA?.Enstationnement2 = stationnement3
            self.tovehiA?.EnParking = parking
            self.tovehiA?.EnParking2 = parking2
            self.tovehiA?.Encirculation = circulation
            self.tovehiA?.Enfrotement = frotement
            self.tovehiA?.Enheurtaitarrieree = heurtaitarrieree
            self.tovehiA?.Enroulaitarrieree = roulaitarrieree
            self.tovehiA?.Enchangfil = changfil
            self.tovehiA?.Endoubler = doubler
            self.tovehiA?.Envirerdroite = virerdroite
            self.tovehiA?.Evirergauche = virergauche
            self.tovehiA?.Enreculer = reculer
            self.tovehiA?.Enenpieter = enpieter
            self.tovehiA?.Envenerdroite = venerdroite
            self.tovehiA?.Enobservesignal = observesignal
         
            
    
            
          
            
            
            
            
            
        }
    }
    
}
