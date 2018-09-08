//
//  SignViewController.swift
//  Assurance
//
//  Created by Mariam on 1/7/18.
//  Copyright © 2018 Mariam. All rights reserved.
//

import UIKit

class SignViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    // var filename=""
    let pickerr = UIImagePickerController()
    var image : UIImage!
    
    
    var filename: String!
    
     let picker = UIImagePickerController()
    
     var start: CGPoint?
    @IBOutlet weak var signimageview: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Signer(_ sender: Any) {
        
        
        
        
        myImageUploadRequest()
        
        
          }
   
    
    @IBAction func Clear(_ sender: Any) {
        
         signimageview.image = nil
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
        start = touch?.location(in: self.signimageview)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
        let end = touch?.location(in: self.signimageview)
        if let s = self.start{
            draw( start: s, end: end!)
        }
        self.start = end
    }
    
    func draw(start:CGPoint,end:CGPoint)  {
        UIGraphicsBeginImageContext(self.signimageview.frame.size)
        let context = UIGraphicsGetCurrentContext()
        signimageview?.image?.draw(in: CGRect(x: 0, y: 0, width: signimageview.frame.width, height: signimageview.frame.height))
        context?.setLineWidth(6)
        context?.beginPath()
        context?.move(to: CGPoint(x: start.x, y: start.y))
        context?.addLine(to: CGPoint(x: end.x , y: end.y))
        context?.setLineCap(CGLineCap.round)
        context?.strokePath()
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        signimageview.image = newImage
        
        
    }

    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        signimageview.contentMode = .scaleAspectFit //3
        signimageview.image = chosenImage
        print(chosenImage)//4
        dismiss(animated:true, completion: nil)
        // UploadRequest()
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    func myImageUploadRequest()
    {
        
        let myUrl = NSURL(string: Constants.URL+"Register/v1/AddImageSignW.php");
        
        
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "POST";
        //zeydine hedhouma raw
        let param = [
            "image"  : "file",
            "constat_id" : String(AppDelegate.idConstat)
            ]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let imageData = UIImageJPEGRepresentation(signimageview.image!, 1)
        
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
                    self.signimageview.image = nil;
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
    
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
    

}
