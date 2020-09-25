//
//  CustomizeViewController.swift
//  Lab7
//
//  Created by EF X01b on 2020-03-12.
//  Copyright © 2020 ics026. All rights reserved.
//

import Foundation
import UIKit
import os

class CustomizeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData = [Style]() //array to hold style attributes, is updated by documentViewController functions
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var italicsButton: UIButton!
    @IBOutlet weak var underlineButton: UIButton!
    var selectedRow = 0 // store the current row
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        input.text = pickerData[selectedRow].title //set textfield with style object title
    }
    @IBAction func updateStyle(_ sender: Any) {
        //editing did begin
        //update pickerdata title at current row
        pickerData[selectedRow].setTitle(t: String(input.text!))
        picker.reloadAllComponents()
    }
    
    //  sets style object attributes and changes button colors
    @IBAction func makeBold(_ sender: Any) {
        
        if pickerData[selectedRow].isBold {
            boldButton.setTitleColor(.blue, for: .normal)
            pickerData[selectedRow].isBold = false
        } else {
            boldButton.setTitleColor(.red, for: .normal)
            pickerData[selectedRow].isBold = true
        }
    }
    //  sets style object attributes and changes button colors
    @IBAction func makeItalic(_ sender: Any) {
        if pickerData[selectedRow].isItalic {
            italicsButton.setTitleColor(.blue, for: .normal)
            pickerData[selectedRow].isItalic = false
        } else {
            italicsButton.setTitleColor(.red, for: .normal)
            pickerData[selectedRow].isItalic = true
        }
    }
    //  sets style object attributes and changes button colors
    @IBAction func makeUnderlined(_ sender: Any) {
        if pickerData[selectedRow].isUnderlined {
            underlineButton.setTitleColor(.blue, for: .normal)
            pickerData[selectedRow].isUnderlined = false
        } else {
            underlineButton.setTitleColor(.red, for: .normal)
            pickerData[selectedRow].isUnderlined = true
        }
    }
    
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }
    
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
       return pickerData.count
   }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].title
   }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        input.text = pickerData[row].title //update textfield when row changes
        selectedRow = row //update selected row
        
        //when row changes, set bold/italic/underline button to appropriate color
        if pickerData[row].isBold {
            boldButton.setTitleColor(.red, for: .normal)
        } else {
            boldButton.setTitleColor(.blue, for: .normal)
        }
        if pickerData[row].isItalic {
            italicsButton.setTitleColor(.red, for: .normal)
        } else {
            italicsButton.setTitleColor(.blue, for: .normal)
        }
        if pickerData[row].isUnderlined {
            underlineButton.setTitleColor(.red, for: .normal)
        } else {
            underlineButton.setTitleColor(.blue, for: .normal)
        }
   }

}
