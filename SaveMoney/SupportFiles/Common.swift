//
//  Common.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//

import Foundation
import SwiftData

/// Number Formatter
var numberFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    
    return formatter
}
//Currency Symbol
var currencySymbol: String {
    let locale = Locale.current
    
    return locale.currencySymbol ?? ""
}
///Currency String
func currencyString(_ value: Double, allowedDigits: Int = 2) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = allowedDigits
    
    return formatter.string(from: .init(value: value)) ?? ""
}
