//
//  Publisher.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import Foundation

struct Publisher {

        // -------------------------------------------------------------
        // MARK: - description
        // -------------------------------------------------------------

    let name: String
    let imageLogoName: String
    var History: String

        // -------------------------------------------------------------
        // MARK: - collection published
        // -------------------------------------------------------------

    let mangas: [Manga]
    let books: [Book]
}
