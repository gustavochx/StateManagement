//
//  NetworkManager.swift
//  StateManagement
//
//  Created by Gustavo Soares on 06/04/22.
//

import Foundation


protocol NetworkManager {
    func request<T: Decodable>(url: URL, response: T.Type, callback: @escaping (T?) -> Void)
}

final class NetworkManagerImplementation: NetworkManager {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func request<T: Decodable>(url: URL, response: T.Type, callback: @escaping (T?) -> Void) {
        session.dataTask(with: url) { data, response, error in
            callback(data.flatMap { try? JSONDecoder().decode(T.self, from: $0) })
        }.resume()
    }
}
