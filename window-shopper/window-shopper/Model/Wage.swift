//
//  Wage.swift
//  window-shopper
//
//  Created by Andreas Schultz on 20.12.18.
//  Copyright © 2018 Andreas Schultz. All rights reserved.
//

import Foundation

class Wage {
    
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price/wage))
    }
}
