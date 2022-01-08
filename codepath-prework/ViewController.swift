//
//  ViewController.swift
//  codepath-prework
//
//  Created by Harshad Barapatre on 1/6/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var peopleNumber: UILabel!
    @IBOutlet weak var peopleController: UIStepper!
    @IBOutlet weak var splitAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.title = ""
        self.billAmountTextField.becomeFirstResponder()
        self.billAmountTextField.delegate = self
    }

    @IBAction func calculateTip_slider(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0.00
        
        tipSlider.isContinuous = true
        tipSlider.maximumValue = 30
        tipSlider.minimumValue = 15
        
        let percentageTip = Double(Int(tipSlider.value))
        let tip = bill * (percentageTip/100.0)
        let total = bill + tip
        
        splitAmount.text = String(format: "$%.2f", total)
        tipAmountLabel.text = String(format: "$%.2f", tip)
        tipPercentageLabel.text = String(format: "%.0f%%", Double(percentageTip))
        totalLabel.text = String(format: "$%.2f", total)
        
        peopleController.minimumValue = 1
        peopleController.maximumValue = 8
        
        let numPeople = Int(peopleController.value)
        let split = total / Double(numPeople)
        
        peopleNumber.text = String(format: "%.0f", Double(numPeople))
        splitAmount.text = String(format: "$%.2f", split)
    }
}

