//
//  CounterView.swift
//  StateManagement
//
//  Created by Gustavo Soares on 29/03/22.
//

import SwiftUI

struct CounterView: View {

    @ObservedObject var state: AppState

    enum ViewConstants {
        static let mainSpacing: CGFloat = 20.0
        static let counterSpacing: CGFloat = 15.0
    }

    var body: some View {
        VStack(spacing: ViewConstants.mainSpacing) {

            HStack(spacing: ViewConstants.counterSpacing) {

                Button(action: {}) {
                    Text("-")
                }

                Text("\(state.count)")

                Button(action: {}) {
                    Text("+")
                }
            }

            Button(action: {}) {
                Text("Is this prime?")
            }

            Button(action: {}) {
                Text("What is the \(OrdinalFormatter.format(self.state.count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter")
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: .init())
    }
}
