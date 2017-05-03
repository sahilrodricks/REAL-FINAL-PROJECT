//
//  KgToLbViewController.swift
//  MealPrep
//
//  Created by Sahil Rodricks on 5/2/17.
//  Copyright © 2017 SHP. All rights reserved.
//

import Foundation
import UIKit
import Social

class KgToLbViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var LbLabel: UILabel!
    
    @IBOutlet weak var KgField: UITextField!

    
    @IBAction func convertToLbs() {
        
        //Assigns value in text field to the wight in lbs
        let weightInKgs = Double(KgField.text!)
        
        let conversionFactor: Double =  2.20462 //kgs
        
        //Coversion from lbs to kg
        let weightInLbs = (weightInKgs!) / conversionFactor
        
        //Sets the weight of kg to the text value of the label
        LbLabel.text = String(weightInLbs)
        
        
        
        
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

    
   
    
    
    

