//
//  String+Ext.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 20.08.2022.
//

import Foundation

extension String {
    var stringToDouble: Double {
        return Double(self) ?? 0
    }
}

extension Double {
    var doubleToString: String {
        return String(self)
    }
}
