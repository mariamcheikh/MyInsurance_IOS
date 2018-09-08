//
//  CameraViewController.swift
//  Assurance
//
//  Created by Mariam on 1/10/18.
//  Copyright © 2018 Mariam. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    let pickerController = UIImagePickerController()

    @IBOutlet var imageView: UIImageView!
    let pickerr = UIImagePickerController()
    var image : UIImage!
    
    
    var filename: String!
    
    let picker = UIImagePickerController()
    
    @IBAction func TakePhoto(_ sender: Any) {
        
        //present(pickerController, animated: true,completion: nil)
        
    }
    
    @IBAction func AjouterPhoto(_ sender: Any) {
        
        myImageUploadRequest()
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // pickerController.sourceType = UIImagePickerControllerSourceType.camera
         //pickerController.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    func myImageUploadRequest()
    {
        
        let myUrl = NSURL(string: Constants.URL+"Register/v1/AddImageCameraW.php");
        
        
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "POST";
        //zeydine hedhouma raw
        let param = [
            "image"  : "file",
            "constat_id" : String(AppDelegate.idConstat)
            
            ]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 1)
        
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
                    self.imageView.image = nil;
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


extension CameraViewController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("The camera has been closed")
    }
    
    
    
}
extension CameraViewController {
    
    
}



extension NSMutableData {
  /*
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
    */
    
    
}

    
  
