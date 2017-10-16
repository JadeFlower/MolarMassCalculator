//
//  Constants.swift
//  MolarMassCalculator
//
//  Created by SETSI on 2017-07-25.
//  Copyright © 2017 SETSI. All rights reserved.
//
import Foundation
import UIKit
import QuartzCore

let screenSize = UIScreen.main.bounds
let screenWidth = UIScreen.main.bounds.width
var screenHeight = UIScreen.main.bounds.height

//design off of these dimensions

let refWidth: CGFloat = 768
let refHeight: CGFloat = 1024


extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

extension Sequence {
    func splitBefore(
        separator isSeparator: (Iterator.Element) throws -> Bool
        ) rethrows -> [AnySequence<Iterator.Element>] {
        var result: [AnySequence<Iterator.Element>] = []
        var subSequence: [Iterator.Element] = []
        
        var iterator = self.makeIterator()
        while let element = iterator.next() {
            if try isSeparator(element) {
                if !subSequence.isEmpty {
                    result.append(AnySequence(subSequence))
                }
                subSequence = [element]
            }
            else {
                subSequence.append(element)
            }
        }
        result.append(AnySequence(subSequence))
        return result
    }
}

extension Character {
    var isUpperCase: Bool { return String(self) == String(self).uppercased() }
}

extension Character {
    var isUppercase: Bool { return String(self).uppercased() == String(self) }
}

extension String
{
    func replacingLastOccurrenceOfString(_ searchString: String,
                                         with replacementString: String,
                                         caseInsensitive: Bool = true) -> String
    {
        let options: String.CompareOptions
        if caseInsensitive {
            options = [.backwards, .caseInsensitive]
        } else {
            options = [.backwards]
        }
        
        if let range = self.range(of: searchString,
                                  options: options,
                                  range: nil,
                                  locale: nil) {
            
            return self.replacingCharacters(in: range, with: replacementString)
        }
        return self
    }
}


struct GlobalConstants {
    //  Colour constants
    
    static let darkpurple: UIColor = UIColor(hex:"272838")
    static let yellow: UIColor = UIColor(hex:"f3de8a")
    static let lightpurple: UIColor = UIColor(hex:"7e7f9a")
    static let offwhite: UIColor = UIColor(hex:"f9f8f8")
    static let pink: UIColor = UIColor(hex:"eb9486")
    static let lightpink: UIColor = UIColor(hex:"FFAEA0")
    static let teal : UIColor = UIColor(hex:"99e6e6")
    static let scale: CGFloat = screenWidth/refWidth
    
    
    static let calcButtonBackground : UIColor = UIColor(hex:"96abcc") // light blue
    static let calcButtonText : UIColor = UIColor(hex:"152949") // midnight blue
    static let background : UIColor = UIColor(hex:"f9fffe") // pale teal
    static let titleText : UIColor = UIColor(hex:"4a6060") // dusty teal
    static let border : UIColor = UIColor(hex:"4478af") // blue
    static let text : UIColor = UIColor(hex:"2e3d4c") // dark blue
    static let textBackground : UIColor = UIColor(hex:"8fbeef") // light teal
    static let textEnabled : UIColor = UIColor(hex:"5d89b7") // more blue
    static let textHint : UIColor = UIColor(hex:"b8d8f9") // lighter blue
    static let segUnselect : UIColor = UIColor(hex:"4b7773") // aqua
    static let segSelect : UIColor = UIColor(hex:"81dbd2") // light aqua
    
     static let answer : UIColor = UIColor(hex:"02511e") // dark green

  
}
