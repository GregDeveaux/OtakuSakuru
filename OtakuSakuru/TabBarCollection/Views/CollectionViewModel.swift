//
//  CollectionViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 21/02/2023.
//

import Foundation

class CollectionViewModel: ObservableObject {

    @Published var searchQueryTextField = ""

    @Published var mangaBooksCollection: [Book] = Book.example

    @Published var arrayOfButtonsTitleForFilter: [String] = []


        // ----------------------------------------------------------------
        // MARK: - collection Manga books
        // ----------------------------------------------------------------

        /// sort the books and section by filter and by alphabetic
        /// - Parameter filter:chosen filter by the user
    func setUpList(by filter: SortFilter) {
            // create one button by section according to filter
        createTheAnchorsOfSection(by: filter)
            // sort the book according to filter and alphabetic
        mangaBooksCollection
            .sort { ($0.title.capitalized, $0.volume) < ($1.title.capitalized, $1.volume) }
    }


        // ----------------------------------------------------------------
        // MARK: - section
        // ----------------------------------------------------------------

        /// Create section according to filter and sort the array by section and  alphabetic (used to create anchorButton)
        /// - Parameter filter: chosen filter by the user
    private func createTheAnchorsOfSection(by filter: SortFilter) {
        switch filter {
            case .title:
                arrayOfButtonsTitleForFilter.removeAll()
                arrayOfButtonsTitleForFilter = mangaBooksCollection.map { $0.title }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for title \(arrayOfButtonsTitleForFilter)")

            case .mangaka:
                arrayOfButtonsTitleForFilter.removeAll()
                    // retrieve the different mangakas of the book sorted
                mangaBooksCollection.forEach { book in
                    book.mangakas.forEach {
                        arrayOfButtonsTitleForFilter.append($0.name)
                    }
                }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for mangaka \(arrayOfButtonsTitleForFilter)")

            case .publisher:
                arrayOfButtonsTitleForFilter.removeAll()
                arrayOfButtonsTitleForFilter = mangaBooksCollection.map { $0.publisher }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for publisher \(arrayOfButtonsTitleForFilter)")

            case .kind:
                arrayOfButtonsTitleForFilter.removeAll()
                    // retrieve the different kinds of the book sorted
                arrayOfButtonsTitleForFilter = mangaBooksCollection
                    .flatMap { $0.kinds }
                    .map { $0.rawValue }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for kind \(arrayOfButtonsTitleForFilter)")

            case .category:
                arrayOfButtonsTitleForFilter.removeAll()
                arrayOfButtonsTitleForFilter = mangaBooksCollection.map { $0.category.rawValue }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for category \(arrayOfButtonsTitleForFilter)")
        }
    }

    private func sortAlphabetic() {
        arrayOfButtonsTitleForFilter = Array(Set(arrayOfButtonsTitleForFilter))
            .map { $0.capitalized }
            .sorted { $0 < $1 }
    }

        /// Give the book values  to check equality with the section to store  the books under each section
        /// - Parameters:
        ///   - book: book in the collection
        ///   - chosenfilter: filter choose by the user to sort the collection
        /// - Returns: value string
    func giveBookValueToStoreUnderEachSection(book: Book, chosenfilter: SortFilter) -> String {
        switch chosenfilter {
            case .title:
                return book.title.capitalized
            case .mangaka:
                var mangakaName = ""
                book.mangakas.forEach { mangaka in
                    mangakaName = mangaka.name
                    print(mangaka.name)
                }
                return mangakaName.capitalized
            case .publisher:
                return book.publisher.capitalized
            case .kind:
                var kindValue = ""
                book.kinds.forEach { kind in
                    kindValue = kind.rawValue.capitalized
                }
                return kindValue
            case .category:
                return book.category.rawValue.capitalized
        }
    }

    func deleteRow(indexSet: IndexSet) {
        mangaBooksCollection.remove(atOffsets: indexSet)
    }
}

    // ----------------------------------------------------------------
    // MARK: - filter
    // ----------------------------------------------------------------

enum SortFilter: String, CaseIterable, Identifiable {
        //create id for Identifiable
    var id: Self {
            return self
        }

    case title = "Titre"
    case mangaka = "Mangaka"
    case publisher = "Éditeur"
    case kind = "Genre"
    case category = "Catégorie"
}
