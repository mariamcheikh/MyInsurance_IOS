//
//  CirconstanceVehiAViewController.swift
//  Assurance
//
//  Created by Mariam on 11/29/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire

class CirconstanceVehiAViewController: UIViewController {
    
    @IBOutlet weak var labelMessage: UILabel!
    
     var todrawaccident: DrawAccidentViewController?
    
    var afficherconstatUser: DisplayConstatUserViewController?
    
        let URL_ADD_Constat = Constants.URL+"Register/v1/InsertConstat.php"
    
     //let mariem: Int! = Result
    
    //var mariem = 0
    
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
    
    
    var Enstationnement: String!
    var Enstationnement1: String!
    var Enstationnement2: String!
    var EnParking: String!
    var EnParking2: String!
    var Encirculation: String!
    var Enfrotement: String!
    var Enheurtaitarrieree: String!
    var Enroulaitarrieree: String!
    var Enchangfil: String!
    var Endoubler: String!
    var Envirerdroite: String!
    var Evirergauche: String!
    var Enreculer: String!
    var Enenpieter: String!
    var Envenerdroite: String!
    var Enobservesignal: String!

    
    
    var Avehiassurepar: String!
    var Acontratassu: String!
    var Aassuraagence: String!
    var Avalabledu: String!
    var Avalableau: String!
    var AnomConducteur: String!
    var AprenomConducteur: String!
    var Aaddresseconducteur: String!
    var ApermisConducteur: String!
    var Adelivrele: String!
    var Anomassureur: String!
    var Aprenomassureur: String!
    var Aaddresseassureur: String!
    var Atelassureur: String!
    var Amarque: String!
    var ANumimmatri: String!
    var Asenssuivis: String!
    var Avenantde: String!
    var Aallanta: String!
    var Adegat: String!
    var Aobservation: String!

    
    
    @IBOutlet weak var enstationnementA: UISwitch!
    @IBOutlet weak var quitstationnementA: UISwitch!
    @IBOutlet weak var prenantstationnementA: UISwitch!
    @IBOutlet weak var sortantparkingA: UISwitch!
    @IBOutlet weak var sengageantParkingA: UISwitch!
    @IBOutlet weak var arretCirculationA: UISwitch!
    @IBOutlet weak var frottementA: UISwitch!
    @IBOutlet weak var heurtaitarriereA: UISwitch!
    @IBOutlet weak var roulaitarriereA: UISwitch!
    @IBOutlet weak var changeantfileA: UISwitch!
    @IBOutlet weak var doublaitA: UISwitch!
    @IBOutlet weak var viraitdroiteA: UISwitch!
    @IBOutlet weak var viraitgaucheA: UISwitch!
    @IBOutlet weak var reculaitA: UISwitch!
    @IBOutlet weak var senpeiteA: UISwitch!
    @IBOutlet weak var venaitdedroiteA: UISwitch!
    @IBOutlet weak var observaitsignalA: UISwitch!
    
    
    
    
    
    
    var stationnementA: String! = "NON"
    var stationnement2A: String! = "NON"
    var stationnement3A: String! = "NON"
    var parkingA: String! = "NON"
    var parking2A: String! = "NON"
    var circulationA: String! = "NON"
    var frotementA: String! = "NON"
    var heurtaitarriereeA: String! = "NON"
    var roulaitarriereeA: String! = "NON"
    var changfilA: String! = "NON"
    var doublerA: String! = "NON"
    var virerdroiteA: String! = "NON"
    var virergaucheA: String! = "NON"
    var reculerA: String! = "NON"
    var enpieterA: String! = "NON"
    var venerdroiteA: String! = "NON"
    var observesignalA: String! = "NON"

    

    @IBOutlet weak var CirconstanceVoitureA: UIScrollView!
    
    
    
    
    @IBAction func OnenstationnementA(_ sender: Any) {
        
        let state : Bool = enstationnementA.isOn
        if state == true {
            print("true yey")
            stationnementA = "OUI"
        } else {
            print("oups")
            stationnementA = "NON"
        }
        
    }
    
    
    @IBAction func OnquitstationnementA(_ sender: Any) {
        let state : Bool = quitstationnementA.isOn
        if state == true {
            print("yey")
            stationnement2A = "OUI"
        } else {
            print("no")
            stationnement2A = "NON"
        }
    }
    
    
    @IBAction func OnprenantstationnementA(_ sender: Any) {
        let state : Bool = prenantstationnementA.isOn
        if state == true {
               print("yey")
            stationnement3A = "OUI"
        } else {
            print("no")
            stationnement3A = "NON"
        }
        
    }
    
    
    
    @IBAction func OnsortantparkingA(_ sender: Any) {
        let state : Bool = sortantparkingA.isOn
        if state == true {
               print("yey")
            parkingA = "OUI"
        } else {
            print("no")
            parkingA = "NON"
        }
    }
    
    
    @IBAction func OnsengageantParkingA(_ sender: Any) {
        let state : Bool = sengageantParkingA.isOn
        if state == true {
            print("yes")
            parking2A = "OUI"
        } else {
            print("no")
            parking2A = "NON"
        }
    }
    
    
    @IBAction func OnarretCirculationA(_ sender: Any) {
        let state : Bool = arretCirculationA.isOn
        if state == true {
               print("yey")
            circulationA = "OUI"
        } else {
            print("no")
            circulationA = "NON"
        }

    }
    
    
    
    @IBAction func OnfrottementA(_ sender: Any) {
        let state : Bool = frottementA.isOn
        if state == true {
               print("yey")
            frotementA = "OUI"
        } else {
            print("no")
            frotementA = "NON"
        }
    }
    
    
    @IBAction func OnheurtaitarriereA(_ sender: Any) {
        let state : Bool = heurtaitarriereA.isOn
        if state == true {
               print("yey")
            heurtaitarriereeA = "OUI"
        } else {
            print("no")
            heurtaitarriereeA = "NON"
        }

    }
    
    
    
    
    @IBAction func OnroulaitarriereA(_ sender: Any) {
        let state : Bool = roulaitarriereA.isOn
        if state == true {
               print("yey")
            roulaitarriereeA = "OUI"
        } else {
            print("no")
            roulaitarriereeA = "NON"
        }
        
    }
    
    
    @IBAction func OnchangeantfileA(_ sender: Any) {
        let state : Bool = changeantfileA.isOn
        if state == true {
               print("yey")
            changfilA = "OUI"
        } else {
            print("no")
            changfilA = "NON"
        }
    }
    
    
    
    
    @IBAction func OndoublaitA(_ sender: Any) {
        let state : Bool = doublaitA.isOn
        if state == true {
               print("yey")
            doublerA = "OUI"
        } else {
            print("no")
            doublerA = "NON"
        }
    }
    
    
    @IBAction func OnviraitdroiteA(_ sender: Any) {
        let state : Bool = viraitdroiteA.isOn
        if state == true {
               print("yey")
            virerdroiteA = "OUI"
        } else {
            print("no")
            virerdroiteA = "NON"
        }
    }
    
    
    
    
    
    @IBAction func OnviraitgaucheA(_ sender: Any) {
        let state : Bool = viraitgaucheA.isOn
        if state == true {
               print("yey")
            virergaucheA = "OUI"
        } else {
            print("no")
            virergaucheA = "NON"
        }

    }
    
    
    
    
    @IBAction func OnreculaitA(_ sender: Any) {
        let state : Bool = reculaitA.isOn
        if state == true {
               print("yey")
            reculerA = "OUI"
        } else {
            print("no")
            reculerA = "NON"
        }
    }
    
    @IBAction func OnsenpeiteA(_ sender: Any) {
        let state : Bool = senpeiteA.isOn
        if state == true {
               print("yey")
            enpieterA = "OUI"
        } else {
            print("no")
            enpieterA = "NON"
        }
    }
    
    
    @IBAction func OnvenaitdedroiteA(_ sender: Any) {
    
        let state : Bool = venaitdedroiteA.isOn
        if state == true {
               print("yey")
            venerdroiteA = "OUI"
        } else {
            print("no")
            venerdroiteA = "NON"
        }

    }
    
    
    
    
    
    @IBAction func OnobservaitsignalA(_ sender: Any) {
        let state : Bool = observaitsignalA.isOn
        if state == true {
               print("yey")
            observesignalA = "OUI"
        } else {
               print("no")
            observesignalA = "NON"
        }

    }
    
    
    
    @IBAction func AddConstat(_ sender: Any) {

    
        
        let parameters: Parameters=[
            "date":date!,
            "heure":heure!,
            "lieu":lieu,
            "blesse":blesse!,
            "degat":degat!,
            "temoins":temoins!,
            "vehiculeassure":Bvehiassurepar!,
            "contratassure":Bcontratassu!,
            "agence":Bassuraagence!,
            "attestationdu":Bvalabledu!,
            "attestationau":Bvalableau!,
            "nomConducteur":BnomConducteur!,
            "prenomConducteur":BprenomConducteur!,
            "addresseConducteur":Baddresseconducteur!,
            "permisConducteur":BpermisConducteur!,
            "permisdelivre":Bdelivrele!,
            "nomassure":Bnomassureur!,
            "prenomasure":Bprenomassureur!,
            "addresseassure":Baddresseassureur!,
            "telassure":Btelassureur!,
            "marquevoiture":Bmarque!,
            "immatriculation":BNumimmatri!,
            "senssuivis":Bsenssuivis!,
            "venantde":Bvenantde!,
            "allanta":Ballanta!,
            "degatapparents":Bdegat!,
            "observations":Bobservation!,
            "stationnement":Enstationnement!,
            "quiterstationnement":Enstationnement1!,
            "prenantstationnement":Enstationnement2!,
            "sortantParking":EnParking!,
            "engagerparking":EnParking2!,
            "arretcirculation":Encirculation!,
            "frottement":Enfrotement!,
            "heurtaitarriere":Enheurtaitarrieree!,
            "roulermemesens":Enroulaitarrieree!,
            "changementfile":Enchangfil!,
            "doublait":Endoubler!,
            "viraitdroite":Envirerdroite!,
            "viraitgauche":Evirergauche!,
            "reculait":Enreculer!,
            "chausse":Enenpieter!,
            "carrefour":Envenerdroite!,
            "priorite":Enobservesignal!,
            "vehiculeassureA":Avehiassurepar!,
            "contratassureA":Acontratassu!,
            "agenceA":Aassuraagence!,
            "attestationduA":Avalabledu!,
            "attestationauA":Avalableau!,
            "nomConducteurA":AnomConducteur!,
            "prenomConducteurA":AprenomConducteur!,
            "addresseConducteurA":Aaddresseconducteur!,
            "permisConducteurA":ApermisConducteur!,
            "permisdelivreA":Adelivrele!,
            "nomassureA":Anomassureur!,
            "prenomasureA":Aprenomassureur!,
            "addresseassureA":Aaddresseassureur!,
            "telassureA":Atelassureur!,
            "marquevoitureA":Amarque!,
            "immatriculationA":ANumimmatri!,
            "senssuivisA":Asenssuivis!,
            "venantdeA":Avenantde!,
            "allantaA":Aallanta!,
            "degatapparentsA":Adegat!,
            "observationsA":Aobservation!,
            "stationnementA":stationnementA!,
            "quiterstationnementA":stationnement2A!,
            "prenantstationnementA":stationnement3A!,
            "sortantParkingA":parkingA!,
            "engagerparkingA":parking2A!,
            "arretcirculationA":circulationA!,
            "frottementA":frotementA!,
            "heurtaitarriereA":heurtaitarriereeA!,
            "roulermemesensA":roulaitarriereeA!,
            "changementfileA":changfilA!,
            "doublaitA":doublerA!,
            "viraitdroiteA":virerdroiteA!,
            "viraitgaucheA":virergaucheA!,
            "reculaitA":reculerA!,
            "chausseA":enpieterA!,
            "carrefourA":venerdroiteA!,
            "prioriteA":observesignalA!,
            "user_id":id!
    
        ]
        
        //Sending http post request
        Alamofire.request(URL_ADD_Constat, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
              //  print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    print(result)
                    let idconstat = result
                    AppDelegate.idConstat = idconstat as! Int
                    print(idconstat)
                    //converting it as NSDictionary
                  //  let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                   // self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 CirconstanceVoitureA.contentSize = CGSize(width: self.view.frame.width, height: 1500)
        
        
        
        
        print(id,date,heure,lieu,blesse,degat,temoins,Bvehiassurepar,Bcontratassu,Bassuraagence,Bvalableau,Bvalabledu,BnomConducteur,BprenomConducteur,Baddresseconducteur,BpermisConducteur,Bdelivrele,Bnomassureur,Bprenomassureur,Baddresseassureur,Btelassureur,Bmarque,BNumimmatri,Bsenssuivis,Bvenantde,Ballanta,Bdegat,Bobservation,Enstationnement,Enstationnement1,Enstationnement2,EnParking,EnParking2,Encirculation,Enfrotement,Enheurtaitarrieree,Enroulaitarrieree,Enchangfil,Endoubler,Envirerdroite,Evirergauche,Enreculer,Enenpieter,Envenerdroite,Enobservesignal,Avehiassurepar,Acontratassu,Aassuraagence,Avalabledu,Avalableau,AnomConducteur,AprenomConducteur,Aaddresseconducteur,ApermisConducteur,Adelivrele,Anomassureur,Aprenomassureur,Aaddresseassureur,Atelassureur,Amarque,ANumimmatri,Asenssuivis,Avenantde,Aallanta,Adegat,Aobservation)

    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
      
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "afficherconstatUser" {
            
            self.afficherconstatUser = segue.destination as? DisplayConstatUserViewController
            self.afficherconstatUser?.id = id
            
            
        }
        
        if segue.identifier == "todrawaccident" {
            
            self.todrawaccident = segue.destination as? DrawAccidentViewController
            self.todrawaccident?.id = id
            self.todrawaccident?.date = date
            self.todrawaccident?.heure = heure
            self.todrawaccident?.lieu = lieu
            self.todrawaccident?.blesse = blesse
            self.todrawaccident?.degat = degat
            self.todrawaccident?.temoins = temoins
            
            self.todrawaccident?.Bvehiassurepar = Bvehiassurepar
            self.todrawaccident?.Bcontratassu = Bcontratassu
            self.todrawaccident?.Bassuraagence = Bassuraagence
            self.todrawaccident?.Bvalabledu = Bvalabledu
            self.todrawaccident?.Bvalableau = Bvalableau
            self.todrawaccident?.BnomConducteur = BnomConducteur
            
            self.todrawaccident?.BprenomConducteur = BprenomConducteur
            self.todrawaccident?.Baddresseconducteur = Baddresseconducteur
            self.todrawaccident?.BpermisConducteur = BpermisConducteur
            self.todrawaccident?.Bdelivrele = Bdelivrele
            self.todrawaccident?.Bnomassureur = Bnomassureur
            
            self.todrawaccident?.Bprenomassureur = Bprenomassureur
            self.todrawaccident?.Baddresseassureur = Baddresseassureur
            self.todrawaccident?.Btelassureur = Btelassureur
            self.todrawaccident?.Bmarque = Bmarque
            self.todrawaccident?.BNumimmatri = BNumimmatri
            self.todrawaccident?.Bsenssuivis = Bsenssuivis
            
            self.todrawaccident?.Bvenantde = Bvenantde
            self.todrawaccident?.Ballanta = Ballanta
            self.todrawaccident?.Bdegat = Bdegat
            self.todrawaccident?.Bobservation = Bobservation
            
            self.todrawaccident?.Enstationnement = Enstationnement
            self.todrawaccident?.Enstationnement1 = Enstationnement1
            self.todrawaccident?.Enstationnement2 = Enstationnement2
            self.todrawaccident?.EnParking = EnParking
            self.todrawaccident?.EnParking2 = EnParking2
            self.todrawaccident?.Encirculation = Encirculation
            self.todrawaccident?.Enfrotement = Enfrotement
            self.todrawaccident?.Enheurtaitarrieree = Enheurtaitarrieree
            self.todrawaccident?.Enroulaitarrieree = Enroulaitarrieree
            self.todrawaccident?.Enchangfil = Enchangfil
            self.todrawaccident?.Endoubler = Endoubler
            self.todrawaccident?.Envirerdroite = Envirerdroite
            self.todrawaccident?.Evirergauche = Evirergauche
            self.todrawaccident?.Enreculer = Enreculer
            self.todrawaccident?.Enenpieter = Enenpieter
            self.todrawaccident?.Envenerdroite = Envenerdroite
            self.todrawaccident?.Enobservesignal = Enobservesignal
            
            
            
            self.todrawaccident?.Avehiassurepar = Avehiassurepar
            self.todrawaccident?.Acontratassu = Acontratassu
            self.todrawaccident?.Aassuraagence = Aassuraagence
            self.todrawaccident?.Avalabledu = Avalabledu
            self.todrawaccident?.Avalableau = Avalableau
            self.todrawaccident?.AnomConducteur = AnomConducteur
            self.todrawaccident?.AprenomConducteur = AprenomConducteur
            self.todrawaccident?.Aaddresseconducteur = Aaddresseconducteur
            self.todrawaccident?.ApermisConducteur = ApermisConducteur
            self.todrawaccident?.Adelivrele = Adelivrele
            self.todrawaccident?.Anomassureur = Anomassureur
            self.todrawaccident?.Aprenomassureur = Aprenomassureur
            
            self.todrawaccident?.Aaddresseassureur = Aaddresseassureur
            self.todrawaccident?.Atelassureur = Atelassureur
            self.todrawaccident?.Amarque = Amarque
            self.todrawaccident?.ANumimmatri = ANumimmatri
            self.todrawaccident?.Asenssuivis = Asenssuivis
            self.todrawaccident?.Avenantde = Avenantde
            self.todrawaccident?.Aallanta = Aallanta
            self.todrawaccident?.Adegat = Adegat
            self.todrawaccident?.Aobservation = Aobservation
            
            
            self.todrawaccident?.EnstationnementA = stationnementA
            self.todrawaccident?.Enstationnement1A = stationnement2A
            self.todrawaccident?.Enstationnement2A = stationnement3A
            self.todrawaccident?.EnParkingA = parkingA
            self.todrawaccident?.EnParking2A = parking2A
            self.todrawaccident?.EncirculationA = circulationA
            self.todrawaccident?.EnfrotementA = frotementA
            self.todrawaccident?.EnheurtaitarriereeA = heurtaitarriereeA
            self.todrawaccident?.EnroulaitarriereeA = roulaitarriereeA
            self.todrawaccident?.EnchangfilA = changfilA
            self.todrawaccident?.EndoublerA = doublerA
            self.todrawaccident?.EnvirerdroiteA = virerdroiteA
            self.todrawaccident?.EvirergaucheA = virergaucheA
            self.todrawaccident?.EnreculerA = reculerA
            self.todrawaccident?.EnenpieterA = enpieterA
            self.todrawaccident?.EnvenerdroiteA = venerdroiteA
            self.todrawaccident?.EnobservesignalA = observesignalA
            
            
            
        }
    }

}
