//
//  ViewController.swift
//  Calcluator-Stanford
//
//  Created by Ben Smith on 10/06/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userInMiddleOfTyping = false
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userInMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        
        userInMiddleOfTyping = true
    }
    
    @IBAction func performOperation(sender: UIButton) {
        userInMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "+" {
                
            }
        }
    }

}

