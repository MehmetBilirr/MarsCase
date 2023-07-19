//
//  Error.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation

enum NetworkingError: LocalizedError {
    case badURLResponse(url: URL)
    case unknown

    var errorDescription: String? {
        switch self {
        case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
        case .unknown: return "[⚠️] Unknown error occured"
        }
    }
}
