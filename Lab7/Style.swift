//
//  Style.swift
//  Lab7
//
//  Created by EF X01b on 2020-03-16.
//  Copyright © 2020 ics026. All rights reserved.
//

import Foundation
import os
import UIKit
// class for style objects, self explanatory. 

class Style {
    var title: String
    var isBold: Bool
    var isItalic: Bool
    var isUnderlined: Bool
    
    //initilizing requires a title and all flags set to false
    init(t: String) {
        title = t
        isBold = false
        isItalic = false
        isUnderlined = false
    }
    // setters may not have been necessary but were used anyway
    func setTitle(t: String) {
        title = t
    }
    
    func setBold(b: Bool) {
        isBold = b
    }
    
    func setItalic(i: Bool) {
        isItalic = i
    }
    
    func setUnderLined(u: Bool) {
        isUnderlined = u
    }
}

