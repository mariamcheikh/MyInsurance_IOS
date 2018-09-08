//
//  VehiculeAViewController.swift
//  Assurance
//
//  Created by Mariam on 11/29/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class VehiculeAViewController: UIViewController {

    
    
    var vehiculAtoCirc: CirconstanceVehiAViewController?
    
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
    var Btelassureur: String!
    var BpermisConducteur: String!
    var Bdelivrele: String!
    var Bnomassureur: String!
    var Bprenomassureur: String!
    var Baddresseassureur: String!
   

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

    
    
    @IBOutlet weak var Avehiassurepar: UITextField!
    @IBOutlet weak var Acontratassu: UITextField!
    @IBOutlet weak var Aassuraagence: UITextField!
    @IBOutlet weak var Avalabledu: UITextField!
    @IBOutlet weak var Avalableau: UITextField!
    @IBOutlet weak var AnomConducteur: UITextField!
    @IBOutlet weak var AprenomConducteur: UITextField!
    @IBOutlet weak var Aaddresseconducteur: UITextField!
    @IBOutlet weak var ApermisConducteur: UITextField!
    @IBOutlet weak var Adelivrele: UITextField!
    @IBOutlet weak var Anomassureur: UITextField!
    @IBOutlet weak var Aprenomassureur: UITextField!
    @IBOutlet weak var Aaddresseassureur: UITextField!
    @IBOutlet weak var Atelassureur: UITextField!
    @IBOutlet weak var Amarque: UITextField!
    @IBOutlet weak var ANumimmatri: UITextField!
    @IBOutlet weak var Asenssuivis: UITextField!
    @IBOutlet weak var Avenantde: UITextField!
    @IBOutlet weak var Aallanta: UITextField!
    @IBOutlet weak var Adegat: UITextField!
    @IBOutlet weak var Aobservation: UITextField!

    
    

    
    
    
    @IBOutlet weak var scrollviewVehiA: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         scrollviewVehiA.contentSize = CGSize(width: self.view.frame.width, height: 1500)
        
        print(id,date,heure,lieu,blesse,degat,temoins,Bvehiassurepar,Bcontratassu,Bassuraagence,Bvalableau,Bvalabledu,BnomConducteur,BprenomConducteur,Baddresseconducteur,BpermisConducteur,Bdelivrele,Bnomassureur,Bprenomassureur,Baddresseassureur,Btelassureur,Bmarque,BNumimmatri,Bsenssuivis,Bvenantde,Ballanta,Bdegat,Bobservation,Enstationnement,Enstationnement1,Enstationnement2,
        EnParking,EnParking2,Encirculation,Enfrotement,Enheurtaitarrieree,Enroulaitarrieree,Enchangfil,Endoubler,Envirerdroite,Evirergauche,Enreculer,Enenpieter,Envenerdroite,Enobservesignal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCirA" {
            
            self.vehiculAtoCirc = segue.destination as? CirconstanceVehiAViewController
            self.vehiculAtoCirc?.id = id
            self.vehiculAtoCirc?.date = date
            self.vehiculAtoCirc?.heure = heure
            self.vehiculAtoCirc?.lieu = lieu
            self.vehiculAtoCirc?.blesse = blesse
            self.vehiculAtoCirc?.degat = degat
            self.vehiculAtoCirc?.temoins = temoins
            
            self.vehiculAtoCirc?.Bvehiassurepar = Bvehiassurepar
            self.vehiculAtoCirc?.Bcontratassu = Bcontratassu
            self.vehiculAtoCirc?.Bassuraagence = Bassuraagence
            self.vehiculAtoCirc?.Bvalabledu = Bvalabledu
            self.vehiculAtoCirc?.Bvalableau = Bvalableau
            self.vehiculAtoCirc?.BnomConducteur = BnomConducteur
            
            self.vehiculAtoCirc?.BprenomConducteur = BprenomConducteur
            self.vehiculAtoCirc?.Baddresseconducteur = Baddresseconducteur
            self.vehiculAtoCirc?.BpermisConducteur = BpermisConducteur
            self.vehiculAtoCirc?.Bdelivrele = Bdelivrele
            self.vehiculAtoCirc?.Bnomassureur = Bnomassureur
            
            self.vehiculAtoCirc?.Bprenomassureur = Bprenomassureur
            self.vehiculAtoCirc?.Baddresseassureur = Baddresseassureur
            self.vehiculAtoCirc?.Btelassureur = Btelassureur
            self.vehiculAtoCirc?.Bmarque = Bmarque
            self.vehiculAtoCirc?.BNumimmatri = BNumimmatri
            self.vehiculAtoCirc?.Bsenssuivis = Bsenssuivis
            
            self.vehiculAtoCirc?.Bvenantde = Bvenantde
            self.vehiculAtoCirc?.Ballanta = Ballanta
            self.vehiculAtoCirc?.Bdegat = Bdegat
            self.vehiculAtoCirc?.Bobservation = Bobservation
            
            self.vehiculAtoCirc?.Enstationnement = Enstationnement
            self.vehiculAtoCirc?.Enstationnement1 = Enstationnement1
            self.vehiculAtoCirc?.Enstationnement2 = Enstationnement2
            self.vehiculAtoCirc?.EnParking = EnParking
            self.vehiculAtoCirc?.EnParking2 = EnParking2
            self.vehiculAtoCirc?.Encirculation = Encirculation
            self.vehiculAtoCirc?.Enfrotement = Enfrotement
            self.vehiculAtoCirc?.Enheurtaitarrieree = Enheurtaitarrieree
            self.vehiculAtoCirc?.Enroulaitarrieree = Enroulaitarrieree
            self.vehiculAtoCirc?.Enchangfil = Enchangfil
            self.vehiculAtoCirc?.Endoubler = Endoubler
            self.vehiculAtoCirc?.Envirerdroite = Envirerdroite
            self.vehiculAtoCirc?.Evirergauche = Evirergauche
            self.vehiculAtoCirc?.Enreculer = Enreculer
            self.vehiculAtoCirc?.Enenpieter = Enenpieter
            self.vehiculAtoCirc?.Envenerdroite = Envenerdroite
            self.vehiculAtoCirc?.Enobservesignal = Enobservesignal         

            
            self.vehiculAtoCirc?.Avehiassurepar = Avehiassurepar.text
            self.vehiculAtoCirc?.Acontratassu = Acontratassu.text
            self.vehiculAtoCirc?.Aassuraagence = Aassuraagence.text
            self.vehiculAtoCirc?.Avalabledu = Avalabledu.text
            self.vehiculAtoCirc?.Avalableau = Avalableau.text
            self.vehiculAtoCirc?.AnomConducteur = AnomConducteur.text
            self.vehiculAtoCirc?.AprenomConducteur = AprenomConducteur.text
            self.vehiculAtoCirc?.Aaddresseconducteur = Aaddresseconducteur.text
            self.vehiculAtoCirc?.ApermisConducteur = ApermisConducteur.text
            self.vehiculAtoCirc?.Adelivrele = Adelivrele.text
            self.vehiculAtoCirc?.Anomassureur = Anomassureur.text
            self.vehiculAtoCirc?.Aprenomassureur = Aprenomassureur.text
            
            self.vehiculAtoCirc?.Aaddresseassureur = Aaddresseassureur.text
            self.vehiculAtoCirc?.Atelassureur = Atelassureur.text
            self.vehiculAtoCirc?.Amarque = Amarque.text
            self.vehiculAtoCirc?.ANumimmatri = ANumimmatri.text
            self.vehiculAtoCirc?.Asenssuivis = Asenssuivis.text
            self.vehiculAtoCirc?.Avenantde = Avenantde.text
            self.vehiculAtoCirc?.Aallanta = Aallanta.text
            self.vehiculAtoCirc?.Adegat = Adegat.text
            self.vehiculAtoCirc?.Aobservation = Aobservation.text
            
            
            
            
            
            
            
        }
    }


}
