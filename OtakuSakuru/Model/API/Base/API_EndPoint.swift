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
        case googleBook(ISBN: String)

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
                case .googleBook(let ISBN):
                    components.host = "www.googleapis.com"
                    components.path = "/books/v1/volumes"
                    components.queryItems = [
                        URLQueryItem(name: "q", value: "isbn:\(ISBN)")
                    ]
            }
            guard let url = components.url else {
                preconditionFailure("🛑 ENDPOINT: Invalid URL components: \(self.url)")
            }

            return url
        }
    }
}
