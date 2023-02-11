//
//  Manga.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

/// A manga is the whole oeuvre
struct Manga {

        // -------------------------------------------------------------
        // MARK: - design identity
        // -------------------------------------------------------------

    let title: String
    let imageLogoName: String       // logo of the title

    let imagesDrawName: [String]    // presentation images of Manga for carousel

    let mangakas: [Mangaka]
    let story: String

        // -------------------------------------------------------------
        // MARK: - favorite/notation
        // -------------------------------------------------------------

    var starRatingWholeUser: Double = 0          // for whole notation of the app users (different with book)
    var isFavorite: Bool = false                 // for the user (different with book)

        // categories according to the age
    let categories: [Category]

        // literature kinds
    let kinds: [Kind]

        // release status
    var releaseStatus: State
    enum State: String, CaseIterable {
        case inProgress = "In progress"
        case novelty
        case stopPublished
        case comingSoon
    }

        // -------------------------------------------------------------
        // MARK: - books with the Manga title
        // -------------------------------------------------------------

    let Books: [Book]!
    var followUp: Bool = false
}

enum Category: String {
    case kodomo                 // for kids - age: +3
    case shonen = "Shōnen"      // for male - age: +7
    case shojo = "Shōjo"        // for female - age: +7
    case seinen                 // for male - age: +14
    case seijin                 // for female - age: +14
    case josei                  // for all - age: +18
}

enum Kind: String, CaseIterable {
    case dojinsho = "Dōjinshi"
    case action
    case adventure
    case car
    case comedy
    case cook
    case drama
    case ecchi
    case fantasy
    case gakuen
    case gekiga
    case genderBender = "Gender Bender"
    case harem
    case hentai
    case history
    case horror
    case isekai
    case jidaimono
    case kowai = "Kowaï"
    case mahoShojo = "Maho shōjo"
    case magicalGirl = "Magical Girl"
    case mahouShoujo = "Mahou shoujo"
    case mecha
    case moe
    case music
    case mystery
    case nekketsu
    case pantsu
    case psychological
    case redikomi
    case romance
    case sciFi = "Sci-Fi"
    case sliceOfLife = "Slice of life"
    case amour
    case shakai
    case shitei
    case shojoAi = "Shōjo-ai"
    case shonenAi = "Shōnen-ai"
    case sport
    case supernatural
    case suiri
    case thriller
    case yaoi
    case yonkoma
    case yuri
}
