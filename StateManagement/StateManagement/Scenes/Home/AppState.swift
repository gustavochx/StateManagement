//
//  HomeViewModel.swift
//  StateManagement
//
//  Created by Gustavo Soares on 29/03/22.
//

import Foundation

final class AppState: ObservableObject {
    @Published var count: Int

    init(initialCount: Int = 0) {
        count = initialCount
    }
}
