//
//  ViewController.swift
//  MealPrep
//
//  Created by Sahil Rodricks and Leon Miro on 4/24/17.
//  Copyright © 2017 shp. All rights reserved.
//

import UIKit
import Social


class LbToKgViewController: UIViewController {
    
    //Lable and Text Feild outlet
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    //Occurs when UIButton is clicked.
    @IBAction func convertToKilograms() {
        
        //Assigns value in text field to the wight in lbs
        let weightInLbs = Double(textField.text!)
        
        let conversionFactor: Double =  2.2 //lbs
        
        //Coversion from lbs to kg
        let weightInKg = (weightInLbs!) / conversionFactor
        
        //Sets the weight of kg to the text value of the label
        label.text = String(weightInKg)
        
    }
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
        
    }
    
    //Dismiss keyboard when user touches elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func tweetOut() {
        
        let alert = UIAlertController(title: "share", message: "share your number", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let twitterAction = UIAlertAction(title: "Share on Twitter", style: .default) { (action)  in print("Success")
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                
                
                self.present(post, animated: true, completion: nil)
                
            }
            
            else {
                
                self.showAlert(service: "Twitter")
                
            }
            
         
            
            
    }
        
        alert.addAction(twitterAction)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)

    
     
    
}
    
    
    func showAlert(service: String) {
        let alert = UIAlertController(title: "error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}
