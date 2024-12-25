//
//  ViewController.swift
//  calculadora
//
//  Created by Cristian Vangheli on 20/1/23.
//

import UIKit

class ViewController: UIViewController {

    enum Operation: Int{
        case add
        case substract
        case multiply
        case divide
        case equal
        case none
    }
    
    @IBOutlet weak var contentLabel: UILabel!
        
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMatch = false
    var actualOperation: Operation = .none
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
//    MARK: - Button Actions
    

    @IBAction func addNumber(_ sender: UIButton) {
        if performingMatch {
            contentLabel.text = String(sender.tag)
            numberOnScreen = Double(contentLabel.text!)!
            performingMatch = false
            
        }else{
            contentLabel.text = contentLabel.text! + String(sender.tag)
            numberOnScreen = Double(contentLabel.text!)!
        }
        
        
    }
    
    @IBAction func addOperation(_ sender: UIButton) {
        let currentOperation = Operation(rawValue: sender.tag)!
        
        if currentOperation != .equal{
            previousNumber = Double(contentLabel.text!)!
            
            switch currentOperation {
            case .add:
                contentLabel.text = "+"
            
            case .substract:
                contentLabel.text = "-"
            case .multiply:
                contentLabel.text = "*"
            case .divide:
                contentLabel.text = "/"
            case .equal:
                print("Resultado")
            case .none:
                print("Ninguna operación")
            }
            
            actualOperation = currentOperation
            performingMatch = true
            
        }else{
            switch actualOperation {
            case .add:
                contentLabel.text = String(previousNumber + numberOnScreen)
            case .substract:
                contentLabel.text = String(previousNumber - numberOnScreen)
            case .multiply:
                contentLabel.text = String(previousNumber * numberOnScreen)
            case .divide:
                contentLabel.text = String(previousNumber / numberOnScreen)
            case .equal:
                print("Resultado")
            case .none:
                print("Ninguna operación")
            }
        }
        
    }
    
    
    @IBAction func deleteOperation(_ sender: UIButton) {
        previousNumber = 0
        numberOnScreen = 0
        actualOperation = .none
        contentLabel.text = ""
    }
    
    
    
}

