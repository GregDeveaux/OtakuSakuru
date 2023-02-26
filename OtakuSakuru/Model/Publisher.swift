//
//  Publisher.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import Foundation

struct Publisher: Identifiable {
    
    var id: UUID = UUID()

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


    // -------------------------------------------------------------
    // MARK: - example publisher
    // -------------------------------------------------------------

var examplePublishers: [Publisher] = [
    Publisher(name: "Glénat",
              imageLogoName: "",
              History: "",
              mangas: [],
              books: []),
    
    Publisher(name: "Crunchyroll",
              imageLogoName: "",
              History: "",
              mangas: [],
              books: []),
    
    Publisher(name: "Kana",
              imageLogoName: "",
              History: "",
              mangas: [],
              books: []),

    Publisher(name: "Kurokawa",
              imageLogoName: "",
              History: "",
              mangas: [],
              books: [])
]
