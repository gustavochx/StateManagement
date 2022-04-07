//
//  WolframAlpha.swift
//  StateManagement
//
//  Created by Gustavo Soares on 06/04/22.
//

import Foundation

struct WolframAlphaResponse: Decodable {
    let queryresult: QueryResult
}

struct QueryResult: Decodable {
    let pods: [Pod]
}

struct Pod: Decodable {
    let primary: Bool?
    let subpods: [SubPod]
}

struct SubPod: Decodable {
    let plaintext: String
}
