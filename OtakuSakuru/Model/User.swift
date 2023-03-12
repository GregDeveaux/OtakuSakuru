//
//  User.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation
import FirebaseFirestoreSwift

    // -------------------------------------------------------------
    // MARK: - profil
    // -------------------------------------------------------------

struct ProfilUser: Codable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let age: Int  // for the adult Manga
    let imageName: String

        // Manga books in possession
    let mangasCollection: [Manga]

    var statistics: [Statistic]? = nil
}

    // -------------------------------------------------------------
    // MARK: - statistics
    // -------------------------------------------------------------

struct Statistic: Codable {

}
