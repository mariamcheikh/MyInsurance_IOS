//
//  DrawAccidentViewController.swift
//  Assurance
//
//  Created by Mariam on 11/29/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit
import Alamofire

class DrawAccidentViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{

   // var filename=""
    let pickerr = UIImagePickerController()
       var image : UIImage!

    var constat_id: Int! = 6
    var filename: String!
    
    @IBAction func AjoutImageAccident(_ sender: Any) {
      myImageUploadRequest()
       
        
        
    }
   
    
    @IBAction func Clear(_ sender: Any) {
        
        
        
        drawimageview.image = nil
        
        
    }
    var start: CGPoint?
    
    @IBOutlet weak var drawimageview: UIImageView!
    let picker = UIImagePickerController()

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
    
    
    
      
    ///////////////
    
    var EnstationnementA: String!
    var Enstationnement1A: String!
    var Enstationnement2A: String!
    var EnParkingA: String!
    var EnParking2A: String!
    var EncirculationA: String!
    var EnfrotementA: String!
    var EnheurtaitarriereeA: String!
    var EnroulaitarriereeA: String!
    var EnchangfilA: String!
    var EndoublerA: String!
    var EnvirerdroiteA: String!
    var EvirergaucheA: String!
    var EnreculerA: String!
    var EnenpieterA: String!
    var EnvenerdroiteA: String!
    var EnobservesignalA: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print(id,date,heure,lieu,blesse,degat,temoins,Bvehiassurepar,Bcontratassu,Bassuraagence,Bvalableau,Bvalabledu,BnomConducteur,BprenomConducteur,Baddresseconducteur,BpermisConducteur,Bdelivrele,Bnomassureur,Bprenomassureur,Baddresseassureur,Bmarque,BNumimmatri,Bsenssuivis,Bvenantde,Ballanta,Bdegat,Bobservation,Enstationnement,Enstationnement1,Enstationnement2,EnParking,EnParking2,Encirculation,Enfrotement,Enheurtaitarrieree,Enroulaitarrieree,Enchangfil,Endoubler,Envirerdroite,Evirergauche,Enreculer,Enenpieter,Envenerdroite,Enobservesignal,Avehiassurepar,Acontratassu,Aassuraagence,Avalabledu,Avalableau,AnomConducteur,AprenomConducteur,Aaddresseconducteur,ApermisConducteur,Adelivrele,Anomassureur,Aprenomassureur,Aaddresseassureur,Atelassureur,Amarque,ANumimmatri,Asenssuivis,Avenantde,Aallanta,Adegat,Aobservation,EnstationnementA,Enstationnement1A,Enstationnement2A,EnParkingA,EnParking2A,EncirculationA,EnfrotementA,EnheurtaitarriereeA,EnroulaitarriereeA,EnchangfilA,EndoublerA,EnvirerdroiteA,EvirergaucheA,EnreculerA,EnenpieterA,EnvenerdroiteA,EnobservesignalA)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
        start = touch?.location(in: self.drawimageview)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
          let end = touch?.location(in: self.drawimageview)
        if let s = self.start{
         draw( start: s, end: end!)
        }
        self.start = end
    }
    
    func draw(start:CGPoint,end:CGPoint)  {
        UIGraphicsBeginImageContext(self.drawimageview.frame.size)
        let context = UIGraphicsGetCurrentContext()
        drawimageview?.image?.draw(in: CGRect(x: 0, y: 0, width: drawimageview.frame.width, height: drawimageview.frame.height))
        context?.setLineWidth(6)
        context?.beginPath()
        context?.move(to: CGPoint(x: start.x, y: start.y))
        context?.addLine(to: CGPoint(x: end.x , y: end.y))
        context?.setLineCap(CGLineCap.round)
         context?.strokePath()
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        drawimageview.image = newImage
        
        
    }
    
    func imagePickerController(_ picker:UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        drawimageview.contentMode = .scaleAspectFit //3
        drawimageview.image = chosenImage
        print(chosenImage)//4
        dismiss(animated:true, completion: nil)
        // UploadRequest()
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func myImageUploadRequest()
    {
        
        let myUrl = NSURL(string: Constants.URL+"Register/v1/AddImageAccidentW.php");
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "POST";
        //zeydine hedhouma raw
        let param = [
            "image"  : "file",
            "constat_id" : String(AppDelegate.idConstat)
        
        ] //as [String : Any]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let imageData = UIImageJPEGRepresentation(drawimageview.image!, 1)
        
        if(imageData==nil)  { return; print("no image")}
        
        request.httpBody = createBodyWithParameters(parameters: param, filePathKey: "file", imageDataKey: imageData! as NSData, boundary: boundary) as Data
        print("fama taswira")
        
        //  myActivityIndicator.startAnimating();
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            // You can print out response object
            print("******* response = \(String(describing: response))")
            
            // Print out reponse body
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("****** response data = \(responseString!)")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                
                print(json)
                
                DispatchQueue.main.async(execute: {
                    //    self.myActivityIndicator.stopAnimating()
                    self.drawimageview.image = nil;
                });
                
            }catch
            {
                print(error)
            }
            
        }
        
        task.resume()
    }
    
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        //na3ti esm random lel image
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomName = ""
        
        for _ in 0 ..< 20{
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomName += NSString(characters: &nextChar, length: 1) as String
        }
        
        filename = randomName+".jpg" as String!
        let mimetype = "image/jpg"
        
        body.appendString(string: "--\(boundary)\r\n")
        body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
        body.append(imageDataKey as Data)
        body.appendString(string: "\r\n")
        
        body.appendString(string: "--\(boundary)--\r\n")
        
        return body
    }
    
    
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
}
extension NSMutableData {
   
   /*func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
    
    //random name image
   */
 
}
