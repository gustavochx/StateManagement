//
//  WolframService.swift
//  StateManagement
//
//  Created by Gustavo Soares on 06/04/22.
//

import Foundation

final class WolframService {

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager = NetworkManagerImplementation()) {
        self.networkManager = networkManager
    }

    func nthPrime(_ number: Int, callback: @escaping(Int?) -> Void) {
        networkManager.request(url: WolframAPI.input(query: "prime \(number)").endpoint,
                               response: WolframAlphaResponse.self) { result in
            callback(result.flatMap {
                $0.queryresult.pods.first { $0.primary == .some(true) }?.subpods.first?.plaintext
            }.flatMap(Int.init))
        }
    }

}
