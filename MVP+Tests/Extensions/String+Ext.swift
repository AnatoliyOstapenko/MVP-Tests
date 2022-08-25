//
//  String+Ext.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 20.08.2022.
//

import Foundation

extension String {
    var stringToDouble: Double {
        if let item = Double(self) {
            return item
        }
        return 0
    }
}

extension Double {
    var doubleToString: String {
        return String(self)
    }
}
