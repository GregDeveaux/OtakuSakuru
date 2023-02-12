//
//  API_Wikipedia.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 12/02/2023.
//

import Foundation

extension API {

        // ------------------------------------------------------------------------
        // use this API to retrieve the informations for the author and manga title
        // ------------------------------------------------------------------------

    enum Wikipedia {
        struct Query: Codable {
            var normalized: Normalized?
            var pages: [Int: Page]
        }

        struct Normalized: Codable {
            var from: String?
            var to: String?
        }

        struct Page: Codable {
            let pageid: Int
            let title: String
            let terms: [String: [String]]?
        }
    }
}



