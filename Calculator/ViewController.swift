//
//  ViewController.swift
//  Calculator
//
//  Created by Ruben Espinosa Roldan on 21/06/15.
//  Copyright (c) 2015 Ruben Espinosa Roldan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsWritting = false
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsWritting {
         display.text = display.text! + digit
        } else {
         display.text = digit
         userIsWritting = true
        }

    }
    @IBAction func enter() {
        userIsWritting = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsWritting  {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.perfomOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }

        }
        
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
           display.text = "\(newValue)"
        }
    }
}

