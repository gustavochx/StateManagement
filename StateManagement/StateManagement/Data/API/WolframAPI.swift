//
//  WolframAPI.swift
//  StateManagement
//
//  Created by Gustavo Soares on 06/04/22.
//

import Foundation

enum WolframAPI {
    case input(query: String)
}

extension WolframAPI {

    private var baseUrl: String {
        "https://api.wolframalpha.com/v2/query"
    }

    private var apiKey: String {
        "6H69Q3-828TKQJ4EP"
    }

    private var baseUrlComponents: URLComponents {
        var components = URLComponents(string: baseUrl)!
        components.queryItems = [
            URLQueryItem(name: "format", value: "plaintext"),
            URLQueryItem(name: "output", value: "JSON"),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        return components
    }

    var endpoint: URL {
        switch self {
        case .input(let query):
            var components = baseUrlComponents
            components.queryItems?.insert(URLQueryItem(name: "input", value: query), at: 0)
            return components.url(relativeTo: nil)!
        }
    }

}
