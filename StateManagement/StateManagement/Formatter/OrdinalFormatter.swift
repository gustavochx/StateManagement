//
//  OrdinalFormatter.swift
//  StateManagement
//
//  Created by Gustavo Soares on 06/04/22.
//

import Foundation

struct OrdinalFormatter {
    static func format(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        return numberFormatter.string(for: number) ?? ""
    }
}
