//
//  API_Openlibrary.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 12/02/2023.
//

import Foundation

extension API {

        // ----------------------------------------------------------------------
        // we use this API to retrieve the informations for the book and it cover
        // ----------------------------------------------------------------------

    enum Openlibrary {
        struct ISBN: Codable {
            var title: String
            var authors: [Author]
            var numberOfPages: Int
            var identifiers: Identifier
            var publishers: Publisher
            var publishDate: String
            var cover: Cover

            enum CodingKeys: String, CodingKey {
                case title
                case authors
                case numberOfPages = "number_of_pages"
                case identifiers
                case publishers
                case publishDate = "publish_date"
                case cover
            }
        }

        struct Author: Codable {
            var name: String
        }

        struct Identifier: Codable {
            var isbn13: String

            enum CodingKeys: String, CodingKey {
                case isbn13 = "isbn_13"
            }
        }

        struct Publisher: Codable {
            var name: String
        }

        struct Cover: Codable {
            var small: String
            var medium: String
            var large: String
        }
    }
}
