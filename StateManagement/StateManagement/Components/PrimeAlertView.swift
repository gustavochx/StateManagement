//
//  PrimeAlertView.swift
//  StateManagement
//
//  Created by Gustavo Soares on 07/04/22.
//

import SwiftUI

struct PrimeAlertView: View {

    @ObservedObject var state: AppState

    var body: some View {
        VStack(alignment: .center) {
            if isPrime(state.count) {
                Text("\(state.count) is prime 🙌🏻")
            } else {
                Text("\(state.count) is not prime 🥶")
            }
        }.font(.largeTitle)
    }

    private func isPrime(_ number: Int) -> Bool {

        if number <= 1 {
            return false
        }

        if number <= 3 {
            return true
        }

        for i in 2...Int(Float(number)) {
            if number % i == 0 { return false }
        }

        return true
    }
}

struct PrimeAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeAlertView(state: .init())
    }
}
