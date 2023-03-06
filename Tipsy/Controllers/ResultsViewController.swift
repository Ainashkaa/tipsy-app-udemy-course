//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ainash Turbayeva on 03.01.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculateValue: String = ""
    var numberOfPeople = 0
    var tips = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calculateValue
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tips)% tip."
    }
    
   
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
