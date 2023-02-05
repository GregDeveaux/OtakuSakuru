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
    let logoTitle: String
    var imageName: String
    let author: String
    let story: String

        // manga liked
    var starRating: Double?
    var isFavorite: Bool?

        // categories/kinds
    enum Category: String {
        case shonen
    }
    var category: Category

    enum Kind: String, CaseIterable {
        case aventure
        case sport
    }
    var kind: Kind

    enum State: String, CaseIterable {
        case novelty
        case stopPublished
        case comingSoon
    }
    var state: State

    let Books: [Book]!
    var followUp: Bool
}
