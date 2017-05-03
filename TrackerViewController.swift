//
//  ViewController.swift
//  MealPrep
//
//  Created by Sahil Rodricks and Leon Miro on 4/24/17.
//  Copyright © 2017 shp. All rights reserved.
//

import UIKit

class TrackerViewController: UIViewController {
    
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
    
    
    //Dismiss keyboard when user touches elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

