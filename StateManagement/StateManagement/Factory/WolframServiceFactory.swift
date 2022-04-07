//
//  WolframServiceFactory.swift
//  StateManagement
//
//  Created by Gustavo Soares on 06/04/22.
//

import Foundation

final class WolframServiceFactory {
    static func makeService() -> WolframService {
        WolframService(networkManager: NetworkManagerImplementation())
    }
}
