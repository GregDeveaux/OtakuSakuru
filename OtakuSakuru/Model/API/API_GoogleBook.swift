//
//  API_GoogleBook.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 12/02/2023.
//

import Foundation

extension API {

        // ----------------------------------------------------------------------------------------
        // we use this API to retrieve the informations according to ISBN for the book and it cover
        // ----------------------------------------------------------------------------------------

    enum GoogleBook {

        struct ISBN: Codable {
            let items: [Item]
        }

        struct Item: Codable {
            let id: String
            let volumeInfo: Info
        }

        struct Info: Codable {
            let title: String
            let authors: [String]
            let description: String
            var pageCount: Int
            var publishedDate: String
        }
    }
}
