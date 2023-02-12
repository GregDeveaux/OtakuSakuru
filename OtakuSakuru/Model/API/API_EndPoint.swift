//
//  API_EndPoint.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 12/02/2023.
//

import Foundation

extension API {
    enum EndPoint {
        case wikipedia(title: String)
        case openlibrary(ISBN: String)
    }
}
