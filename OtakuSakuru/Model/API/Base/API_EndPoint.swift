//
//  API_EndPoint.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 12/02/2023.
//

import Foundation

extension API {

        // ----------------------------------------------------------------------
        // Whole the endpoint Api of the app
        // ----------------------------------------------------------------------

    enum EndPoint {
        case wikipedia(title: String)
        case openlibrary(ISBN: String)

        var url: URL {
            var components = URLComponents()
            components.scheme = "https"

            switch self {
                case .wikipedia(let title):
                    components.host = "en.wikipedia.org"
                    components.path = "/w/api.php"
                    components.queryItems = [
                        URLQueryItem(name: "action", value: "query"),
                        URLQueryItem(name: "format", value: "json"),
                        URLQueryItem(name: "titles", value: "\(title)")
                    ]
                case .openlibrary(let ISBN):
                    components.host = "openlibrary.org"
                    components.path = "/api/books"
                    components.queryItems = [
                        URLQueryItem(name: "type", value: "public"),
                        URLQueryItem(name: "q", value: "\(ISBN)"),
                        URLQueryItem(name: "jscmd", value: "data"),
                        URLQueryItem(name: "format", value: "json")
                    ]
            }
            guard let url = components.url else {
                preconditionFailure("🛑 ENDPOINT: Invalid URL components: \(self.url)")
            }

            return url
        }
    }
}
