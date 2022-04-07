//
//  PrimeAlert.swift
//  StateManagement
//
//  Created by Gustavo Soares on 07/04/22.
//

import Foundation

struct PrimeAlert: Identifiable {
    let prime: Int

    var id: Int { self.prime }
}
