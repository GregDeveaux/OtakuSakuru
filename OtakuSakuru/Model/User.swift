//
//  User.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

    // -------------------------------------------------------------
    // MARK: - profil
    // -------------------------------------------------------------

struct ProfilUser {
    let name: String
    let age: Int  // for the adult Manga
    let imageName: String

        // Manga books in possession
    let mangasCollection: [Manga]

    let statistics: [Statistic]? = nil
}

    // -------------------------------------------------------------
    // MARK: - statistics
    // -------------------------------------------------------------

struct Statistic {

}
