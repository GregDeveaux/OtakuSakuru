//
//  API_Error.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 18/02/2023.
//

import Foundation

enum APIError: LocalizedError {
    case generic(reason: String)
    case `internal`(reason: String)

    var errorDescription: String? {
        switch self {
        case .generic(let reason):
            return "📭 Generic error: \(reason)"
        case .internal(let reason):
            return "📬 Interne error: \(reason)"
        }
    }
}
