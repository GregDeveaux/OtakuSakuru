//
//  CollectionViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 21/02/2023.
//

import Foundation

class CollectionViewModel: ObservableObject {

    @Published var searchQueryTextField = ""

    @Published var sortFilter: SortFilter = .title

    @Published var booksOfUser: [Book] = []

    func sortFilter(_ filter: SortFilter) {
        switch filter {
            case .title:
                booksOfUser = booksOfUser.sorted { $0.title < $1.title && $0.volume < $1.volume }
            case .mangaka:
                booksOfUser = booksOfUser.sorted { $0.mangakas.$2.name < $1.mangakas.$3.name }
            case .publisher:
                booksOfUser = booksOfUser.sorted { $0.publisher < $1.publisher }
            case .kind:
                booksOfUser = booksOfUser.sorted { $0.kinds < $1.kinds }
            case .category:
                booksOfUser = booksOfUser.sorted { $0.category.rawValue < $1.category.rawValue }
            case .date:
                booksOfUser = booksOfUser.sorted { $0.acquisitionDate < $1.acquisitionDate }
        }
    }
}

enum SortFilter: String, CaseIterable, Identifiable {

    var id: Self {
            return self
        }

    case title = "Titre"
    case mangaka = "Mangaka"
    case publisher = "Éditeur"
    case kind = "Genre"
    case category = "Catégorie"
    case date = "Date d'acquisition"
}
