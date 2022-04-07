//
//  CounterView.swift
//  StateManagement
//
//  Created by Gustavo Soares on 29/03/22.
//

import SwiftUI

struct CounterView: View {

    @ObservedObject var state: AppState
    @State var isPrimeModalShown: Bool = false
    @State var isNthPrimeButtonDisabled: Bool = false
    @State var alertNthPrime: PrimeAlert?
    
    var wolframService: WolframService

    enum ViewConstants {
        static let mainSpacing: CGFloat = 20.0
        static let counterSpacing: CGFloat = 15.0
    }

    var body: some View {
        VStack(spacing: ViewConstants.mainSpacing) {

            HStack(spacing: ViewConstants.counterSpacing) {

                Button(action: { state.count -= 1 }) {
                    Text("-")
                }

                Text("\(state.count)")

                Button(action: { state.count += 1 }) {
                    Text("+")
                }
            }

            Button(action: { isPrimeModalShown = true }) {
                Text("Is this prime?")
            }

            LoadingButton(isLoading: $isNthPrimeButtonDisabled, action: nthPrimeButtonAction) {
                Text("\(OrdinalFormatter.format(state.count)) prime?")
            }
        
        }
        .navigationTitle("Counter")
        .sheet(isPresented: $isPrimeModalShown) {
            PrimeAlertView(state: state)
        }
        .alert(item: self.$alertNthPrime) { alert in
            Alert(
                title: Text("The \(OrdinalFormatter.format(self.state.count)) prime is \(alert.prime)"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }

    private func nthPrimeButtonAction() {
        isNthPrimeButtonDisabled = true
        wolframService.nthPrime(state.count) { prime in
            alertNthPrime = prime.map(PrimeAlert.init(prime:))
            isNthPrimeButtonDisabled = false
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState(),
                    wolframService: WolframService(networkManager: NetworkManagerImplementation()))
    }
}
