//
//  HomeView.swift
//  StateManagement
//
//  Created by Gustavo Soares on 29/03/22.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var state: AppState

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Counter") { CounterView(state: state) }
                NavigationLink("Favorite primes") { EmptyView() }
            }
            .lineSpacing(10.0)
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(state: .init())
    }
}
