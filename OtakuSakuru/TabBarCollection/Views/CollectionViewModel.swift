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
    @Published var arrayOfItemForFilter: [String] = []

    @Published var booksOfUser: [Book] = []

    func sortFilter(_ filter: SortFilter) {
        switch filter {
            case .title:
                arrayOfItemForFilter.removeAll()
                booksOfUser = booksOfUser.sorted { ($0.title, $0.volume) < ($1.title, $1.volume) }
                    /// Idem that if We can use if/return :
                    ///  booksOfUser = booksOfUser.sorted {
                    ///      if $0.title == $1.title {
                    ///          return $0.volume < $1.volume
                    ///      }
                    ///      return $0.title < $1.title
                    ///  }
                arrayOfItemForFilter = Array(Set(booksOfUser.map { $0.title }))
                print("✅ COLLECTION_VIEW_MODEL/SORT_FILTER: the manga is sorted by title")
            case .mangaka:
                arrayOfItemForFilter.removeAll()
//                var booksByName: [Book] = []
//                //pour chaque auteur
                booksOfUser.forEach { book in
                    book.mangakas.forEach { mangaka in
                        arrayOfItemForFilter.append(mangaka.name)
//                        booksByName.append(contentsOf: booksOfUser.sorted { ($0.title, $0.volume) < ($1.title, $1.volume) })
                    }
                }
                arrayOfItemForFilter.sort()

            case .publisher:
                arrayOfItemForFilter.removeAll()
                booksOfUser = booksOfUser.sorted { ($0.publisher, $0.title, $0.volume) < ($1.publisher, $1.title, $1.volume) }
                arrayOfItemForFilter = Array(Set(booksOfUser.map { $0.publisher }))

            case .kind:
                arrayOfItemForFilter.removeAll()
                booksOfUser.forEach { books in
                    books.kinds.forEach { kind in
                        arrayOfItemForFilter.append(kind.rawValue)
                    }
                }
//                booksOfUser = booksOfUser.sorted { $0.kinds < $1.kinds }
                arrayOfItemForFilter.sort()

            case .category:
                arrayOfItemForFilter.removeAll()
                booksOfUser = booksOfUser.sorted { ($0.category.rawValue, $0.title, $0.volume) < ($1.category.rawValue, $1.title, $1.volume) }
                arrayOfItemForFilter = Array(Set(booksOfUser.map { $0.category.rawValue }))
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
}
