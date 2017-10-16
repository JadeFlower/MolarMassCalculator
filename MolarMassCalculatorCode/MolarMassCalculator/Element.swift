//
//  Element.swift
//  MolarMassCalculator
//
//  Created by SETSI on 2017-07-26.
//  Copyright © 2017 SETSI. All rights reserved.
//

import Foundation

class Element {
    var name: String = ""
    var weight: Double = 0.0
    
    init (name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func getName() -> String {
        return name
    }
    
    func getWeight() -> Double {
        return weight
    }
    
}
