//
//  Book.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

    // The book is a volume of one manga or artbook(draws) or guidebook(characters info) or novel
struct Book {

        // -------------------------------------------------------------
        // MARK: - categories
        // -------------------------------------------------------------

    let editionType: EditionType
    enum EditionType: String {
        case manga
        case artbook
        case guidebook
        case novel
    }

    let category: Category

    let kind: [Kind]

        // -------------------------------------------------------------
        // MARK: - description
        // -------------------------------------------------------------

        /// book
    let title: String
    let volume: Int
    let imageName: String
    let mangakas: [Mangaka]
        /// published
    let ISBN: Int
    let publisher: String
    let synopsis: String
    let numberOfPages: Int
    let dimensions: String
    let releaseDate: String
    let firstPublicationDate: String? = nil
    let price: Double? = nil

        // -------------------------------------------------------------
        // MARK: - status of published
        // -------------------------------------------------------------

    var state: State = .inProgress
    enum State: String, CaseIterable {
        case inProgress = "In progress"
        case novelty
        case alreadyPublished
        case comingSoon
    }

        // -------------------------------------------------------------
        // MARK: - for user collection (like/follow/read status)
        // -------------------------------------------------------------

        // volume liked
    var starRatingWholeUser: Double = 0
    var isFavorite: Bool = false

        // volume personnal info
    let acquisitionDate: Date? = nil
    var isAcquired: Bool = false {
        didSet {
            if acquisitionDate != nil {
                isAcquired = true
            }
        }
    }

    let totalNumberOfUsersWhoAcquiredIt: Int = 0

         // follow the book to know if published
    var followUp: Bool = false

        // state to read of user for the profil
    var readStatus: UserReadingStatus = .toRead
    enum UserReadingStatus: String, CaseIterable {
        case toRead = "to read"
        case nowPlaying = "now playing"
        case read
        case pause
        case readingCanceled = "reading canceled"
    }
}
