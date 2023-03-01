//
//  CollectionViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 21/02/2023.
//

import Foundation

class CollectionViewModel: ObservableObject {

    @Published var searchQueryTextField = ""

    @Published var mangaBooksOfUser: [Book] = Book.example

    @Published var arrayOfItemsForFilter: [String] = []

    func sortTheBooks(by filter: SortFilter) {
        switch filter {
            case .title:
                arrayOfItemsForFilter.removeAll()
                arrayOfItemsForFilter = Array(Set(mangaBooksOfUser.map { $0.title } )).sorted()

                mangaBooksOfUser.sort { ($0.title, $0.volume) < ($1.title, $1.volume) }
                    /// Idem that if We can use if/return :
                    ///  booksOfUser = booksOfUser.sorted {
                    ///      if $0.title == $1.title {
                    ///          return $0.volume < $1.volume
                    ///      }
                    ///      return $0.title < $1.title
                    ///  }
                print("✅ COLLECTION_VIEW_MODEL/SORT_FILTER: the manga is sorted by title \(mangaBooksOfUser)")
            case .mangaka:
                arrayOfItemsForFilter.removeAll()
//                var booksByName: [Book] = []
//                //pour chaque auteur
                mangaBooksOfUser.forEach { book in
                    book.mangakas.forEach { mangaka in
                        arrayOfItemsForFilter.append(mangaka.name)
//                        booksByName.append(contentsOf: booksOfUser.sorted { ($0.title, $0.volume) < ($1.title, $1.volume) })
                    }
                }
                arrayOfItemsForFilter = Array(Set(arrayOfItemsForFilter)).sorted()

            case .publisher:
                arrayOfItemsForFilter.removeAll()
                arrayOfItemsForFilter = Array(Set(mangaBooksOfUser.map { $0.publisher })).sorted()

                mangaBooksOfUser.sort { ($0.publisher, $0.title, $0.volume) < ($1.publisher, $1.title, $1.volume) }
                print("✅ COLLECTION_VIEW_MODEL/SORT_FILTER: the manga is sorted by publisher \(mangaBooksOfUser)")

            case .kind:
                arrayOfItemsForFilter.removeAll()
                mangaBooksOfUser.forEach { books in
                    books.kinds.forEach { kind in
                        arrayOfItemsForFilter.append(kind.rawValue)
                    }
                }
                arrayOfItemsForFilter = Array(Set(arrayOfItemsForFilter)).sorted()

//                mangaBooksOfUser.sort { $0.kinds < $1.kinds }

            case .category:
                arrayOfItemsForFilter.removeAll()
                arrayOfItemsForFilter = Array(Set(mangaBooksOfUser.map { $0.category.rawValue })).sorted()

                mangaBooksOfUser.sort { ($0.category.rawValue, $0.title, $0.volume) < ($1.category.rawValue, $1.title, $1.volume) }
                print("✅ COLLECTION_VIEW_MODEL/SORT_FILTER: the manga is sorted by category \(mangaBooksOfUser)")
        }
    }

    func mangaSection(chosenfilter: SortFilter, section: Book) -> String {
        switch chosenfilter {
            case .title:
                return section.title
            case .mangaka:
                return section.title
            case .publisher:
                return section.publisher
            case .kind:
                return section.title
            case .category:
                return section.category.rawValue
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
