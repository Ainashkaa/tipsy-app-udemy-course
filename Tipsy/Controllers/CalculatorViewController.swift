//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var calculateValue = "0.0"
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if zeroPcButton.currentTitle == sender.currentTitle {
            zeroPcButton.isSelected = true
        }else{
            zeroPcButton.isSelected = false
        }
        
        if tenPcButton.currentTitle == sender.currentTitle {
            tenPcButton.isSelected = true
        } else {
            tenPcButton.isSelected = false
        }
        
        if twentyPcButton.currentTitle == sender.currentTitle {
            twentyPcButton.isSelected = true
        }else{
            twentyPcButton.isSelected = false
            
        }
        
        let buttonTitle = sender.currentTitle!
        
        let titleMinusPercent = String(buttonTitle.dropLast())
        
        let titleAsNumber = Double(titleMinusPercent)!
        tip = titleAsNumber / 100
        
        billTextField.endEditing(true)
       
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format:" %.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = (billTotal + billTotal * tip) / Double(numberOfPeople)
            print(result)
            calculateValue = String(format: "%.2f", result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculateValue = calculateValue
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tips = Int(tip * 100)
        }
    }
}

