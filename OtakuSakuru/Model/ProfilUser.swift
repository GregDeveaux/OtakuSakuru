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
    var name: String
    var age: Int  // for the adult Manga
    var imageName: String

        // Manga books in possession
    var mangasCollection: [Manga]

    var statistics: [Statistic]? = nil
}

    // -------------------------------------------------------------
    // MARK: - statistics
    // -------------------------------------------------------------

struct Statistic: Codable {

}
