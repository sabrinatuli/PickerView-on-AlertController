//
//  ViewController.swift
//  Picker View Alert Controller
//
//  Created by Kelvin on 7/27/17.
//  Copyright © 2017 Kelvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var choices = ["Toyota","Honda","Chevy","Audi","BMW"]
    var pickerView = UIPickerView()
    var typeValue = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            typeValue = "Toyota"
        } else if row == 1 {
            typeValue = "Honda"
        } else if row == 2 {
            typeValue = "Chevy"
        } else if row == 3 {
            typeValue = "Audi"
        } else if row == 4 {
            typeValue = "BMW"
        }
    }

    //MARK - UIAlertController
    
    @IBAction func showChoices(_ sender: Any) {
        let alert = UIAlertController(title: "Car Choices", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            
            print("You selected " + self.typeValue )
        
        }))
        self.present(alert,animated: true, completion: nil )
    }
}

