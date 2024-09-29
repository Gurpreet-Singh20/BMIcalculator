//
//  ViewController.swift
//  BMIcalculator
//
//  Created by Gurpreet Singh on 2024-09-20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var BMIcategory: UILabel!
    @IBOutlet weak var BMIoutput: UILabel!
    
    var bmi : Double = 0.0
    @IBAction func SiCalculation(_ sender: Any) {
        if let heighttext = Double(height.text!), let weighttext = Double(weight.text!) {
            if heighttext <= 0 || weighttext <= 0 {
                BMIoutput.text = "Invalid input"
                return
            } else{
                let heightInMeters = heighttext / 100
                let bmi = weighttext / (heightInMeters * heightInMeters)
                BMIoutput.text = String(format: "%.2f", bmi)
                category(bmi: bmi)
            }
        }
        
        
       
    }
    @IBAction func Imperial(_ sender: Any) {
        if let heighttext = Double(height.text!), let weighttext = Double(weight.text!) {
            if heighttext <= 0 || weighttext <= 0 {
                BMIoutput.text = "Invalid input"
                return
            } else{
                let bmi = (weighttext * 703) / (heighttext * heighttext)
                BMIoutput.text = String(format: "%.2f", bmi)
                category(bmi: bmi)
            }
        }
    }
    
    func category ( bmi : Double){
        if bmi < 18.5 {
                   BMIcategory.text = "Underweight"
               } else if bmi >= 18.5 && bmi < 24.9 {
                   BMIcategory.text = "Normal weight"
               } else if bmi >= 25 && bmi < 29.9 {
                   BMIcategory.text = "Overweight"
               } else {
                   BMIcategory.text = "Obesity"
               }
    }
}

