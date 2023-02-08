//
//  Book.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

struct Book {
        // principal items
    let imageName: String
    let volume: Int
    let title: String
    let ISBN: Int
    let publisher: String
    let synopsis: String
    let numberOfPages: Int
    let releaseDate: Date
    let publicationDate: Date
    let price: Double

        // volume liked
    var starRating: Double
    var isFavorite: Bool

        // volume personnal info
    let acquisitionDate: Date!
    var isAcquired: Bool {
        didSet {
            if acquisitionDate != nil {
                isAcquired = false
            } else {
                isAcquired = true
            }
        }
    }

    let totalNumberOfUsersWhoAcquiredIt: Int

        // to follow actualities and book release
    enum State: String, CaseIterable {
        case novelty
        case alreadyPublished
        case comingSoon
    }
    var state: State
    var followUp: Bool

        // state to read of user for the profil
    enum UserReadingStatus: String, CaseIterable {
        case toRead = "to read"
        case nowPlaying = "now playing"
        case read
        case pause
        case readingCanceled = "reading canceled"
    }
    var readStatus: UserReadingStatus
}
