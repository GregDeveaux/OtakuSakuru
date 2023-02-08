//
//  Manga.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

struct Manga {
        // principal items
    let title: String
    let logo: String
    var imageName: String
    let author: String
    let story: String

        // manga liked
    var starRating: Double?
    var isFavorite: Bool?

        // categories/kinds
    enum Category: String {
        case artbook
        case josei
        case kodomo
        case novel
        case seijin
        case seinen
        case shonen = "Shōnen"
        case shojo = "Shōjo"
    }
    var category: Category

    enum Theme: String, CaseIterable {
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
    var theme: Theme

    enum State: String, CaseIterable {
        case novelty
        case stopPublished
        case comingSoon
    }
    var state: State

    let Books: [Book]!
    var followUp: Bool
}
