//
//  DocumentViewController.swift
//  Lab7
//
//  Created by EF X01b on 2020-03-12.
//  Copyright © 2020 ics026. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var documentNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var style1: UIButton!
    @IBOutlet weak var style2: UIButton!
    @IBOutlet weak var style3: UIButton!
    @IBOutlet weak var style4: UIButton!
    
    var buttons = [UIButton]() //array to hold each style button
    var document: Document?
    
    //initialize 4 style objects with default titles, these will store style attributes
    var styles = [Style(t: "style1"), Style(t: "style2"), Style(t: "style3"), Style(t: "style4")]
    
    //uiFont for each bold/italic combination
    let plain = UIFont(name: "ArialMT", size: 16.0)!
    let boldFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
    let italicFont = UIFont(name: "Arial-ItalicMT", size: 16.0)!
    let boldItalicFont = UIFont(name: "Arial-BoldItalicMT", size: 16.0)!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textView.attributedText = self.document?.text
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
        //initialize button array
        buttons = [style1, style2, style3, style4]
    }
    
    @IBAction func dismissDocumentViewController() {
        if document?.text != textView.attributedText {
            document?.text = textView.attributedText
            document?.updateChangeCount(.done)
        }
        
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier != "ShowController" {
            return
        }
        guard let customizeViewController = segue.destination.children[0] as? CustomizeViewController else {
            fatalError("Unexpected destination \(segue.destination)")
        }
        //update pickerdata array with the styles array to update styl attributes
        customizeViewController.pickerData = styles
        print(styles)
    }
    
    @IBAction func unwindToDocumentViewController(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CustomizeViewController {
            
            styles = sourceViewController.pickerData // update styles array with pickerdata styles
            
            for i in 0..<4 {
                // update button titles with style object title attribute
                buttons[i].setTitle(sourceViewController.pickerData[i].title, for: .normal)
            }
        }
    }
    
    // each button makes a call to changeStyle with the button row index as its parameter
    @IBAction func style1(_ sender: Any) {
         changeStyle(button: 0)
    }
    
    @IBAction func style2(_ sender: Any) {
        changeStyle(button: 1)
    }
    
    @IBAction func style3(_ sender: Any) {
       changeStyle(button: 2)
    }
    
    @IBAction func style4(_ sender: Any) {
        changeStyle(button: 3)
    }
    
    // checks the styles array with the index of the button clicked
    // updates font style base on the set attributes of the style object
    func changeStyle(button: Int) {
        let range = textView.selectedRange
        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        
        if styles[button].isBold {
          textView.font = boldFont
        }
        if styles[button].isItalic {
          textView.font = italicFont
        }
        if styles[button].isItalic && styles[button].isBold {
          textView.font = boldItalicFont
        }
        if styles[button].isUnderlined {
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
            value: NSUnderlineStyle.single.rawValue, range: range)
            textView.attributedText = attributedString
            print("attempted underline")
        }
        if !styles[button].isItalic && !styles[button].isBold && !styles[button].isUnderlined {
          textView.font = plain
        }
    }
    
}

