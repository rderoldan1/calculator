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
    var operandStack = Array<Double>()

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
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        userIsWritting = false
        switch operation {
        case "×" : performOperation { $0 * $1 }
        case "÷" : performOperation { $1 / $0 }
        case "−" : performOperation { $1 - $0 }
        case "+" : performOperation { $1 + $0 }
        case "√" : performOperation { sqrt( $0) }
        default: break
        }
        
    }
    
    private func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }

    private func performOperation(operation: Double -> Double){
        println("oe")
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
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

