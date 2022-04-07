//
//  StateManagementApp.swift
//  StateManagement
//
//  Created by Gustavo Soares on 29/03/22.
//

import SwiftUI

@main
struct StateManagementApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(state: AppState())
        }
    }
}
