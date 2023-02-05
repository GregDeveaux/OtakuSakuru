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
    let image: String
    let author: String
    let story: String

        // mangas liked
    let starRating: Double
    let isFavorite: Bool

        // categories/kinds
    enum Category: String {
        case shonen
    }

    enum Kind: String {
        case aventure
        case sport

    }

    let volumes: Volume
}

struct Volume {
    let number: Int
    let title: String
    let resume: String
    let numberOfPage: Int
    let date: Date
}
