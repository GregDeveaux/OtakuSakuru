//
//  Mangaka.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import Foundation

    /// A mangaka is the job of creator, cartoonist and sciptwriter in the world of manga
struct Mangaka {

    let name: String

        // -------------------------------------------------------------
        // MARK: - function
        // -------------------------------------------------------------

    let function: Function
    enum Function {
        case creator
        case cartoonist
        case scriptwriter
    }

        // -------------------------------------------------------------
        // MARK: - oeuvres
        // who can be either the whole collection or either by volume
        // -------------------------------------------------------------

    let mangas: [Manga]? = nil
    let volumes: [Book]? = nil

//         -------------------------------------------------------------
//         MARK: - biography
//         -------------------------------------------------------------

    let age: Int? = nil
    let nationality: String? = nil
    let history: String? = nil
}
