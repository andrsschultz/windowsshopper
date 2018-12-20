//
//  ViewController.swift
//  window-shopper
//
//  Created by Andreas Schultz on 19.12.18.
//  Copyright © 2018 Andreas Schultz. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet var wageTextField: CurrencyTextField!
    @IBOutlet var itemPriceTextField: CurrencyTextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var hoursLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcButton.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTextField.inputAccessoryView = calcButton
        itemPriceTextField.inputAccessoryView = calcButton
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }

    
    @objc func calculate() {
        if let wageText = wageTextField.text, let priceText = itemPriceTextField.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                view.endEditing(true)
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                resultLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }

    @IBAction func clearCalculaterButtonTouched(_ sender: Any) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTextField.text = ""
        itemPriceTextField.text = ""
    }
}

