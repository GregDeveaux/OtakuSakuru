//
//  CollectionViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 21/02/2023.
//

import Foundation
import FirebaseFirestore

class CollectionViewModel: ObservableObject {

    @Published var searchQueryTextField = ""

    @Published var mangaBooksCollection: [Manga] = Manga.example

    @Published var titlesSectionBySortFilter: [String] = []

    let firestore = Firestore.firestore()

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
        print("✅ COLLECTION_VIEWMODEL/SET_UP_LIST: the collection contains \(mangaBooksCollection.count) mangas")
    }


        // ----------------------------------------------------------------
        // MARK: - section
        // ----------------------------------------------------------------

        /// Create section according to filter and sort the array by section and  alphabetic (used to create anchorButton)
        /// - Parameter filter: chosen filter by the user
    private func createTheAnchorsOfSection(by filter: SortFilter) {
        switch filter {
            case .title:
                titlesSectionBySortFilter.removeAll()
                titlesSectionBySortFilter = mangaBooksCollection.map { $0.title }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for title \(titlesSectionBySortFilter)")

            case .mangaka:
                titlesSectionBySortFilter.removeAll()
                    // retrieve the different mangakas of the book sorted
                mangaBooksCollection.forEach { book in
                    book.mangakas.forEach {
                        titlesSectionBySortFilter.append($0.name)
                    }
                }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for mangaka \(titlesSectionBySortFilter)")

            case .publisher:
                titlesSectionBySortFilter.removeAll()
                titlesSectionBySortFilter = mangaBooksCollection.map { $0.publisher }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for publisher \(titlesSectionBySortFilter)")

            case .kind:
                titlesSectionBySortFilter.removeAll()
                    // retrieve the different kinds of the book sorted
                titlesSectionBySortFilter = mangaBooksCollection
                    .flatMap { $0.kinds }
                    .map { $0.rawValue }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for kind \(titlesSectionBySortFilter)")

            case .category:
                titlesSectionBySortFilter.removeAll()
                titlesSectionBySortFilter = mangaBooksCollection.map { $0.category.rawValue }
                sortAlphabetic()
                print("✅ COLLECTION_VIEW_MODEL/CREATE_ANCHOR_SECTION: the buttons are for category \(titlesSectionBySortFilter)")
        }
    }

    private func sortAlphabetic() {
        titlesSectionBySortFilter = Array(Set(titlesSectionBySortFilter))
            .map { $0.capitalized }
            .sorted { $0 < $1 }
    }

        /// Give the book values  to check equality with the section to store  the books under each section
        /// - Parameters:
        ///   - chosenfilter: filter choose by the user to sort the collection
        ///   - book: book in the collection
        ///   - section: section to store the book in the collection
        /// - Returns: value true if book value equal at a section
    func giveBookValueToStoreUnderEachSection(chosenfilter: SortFilter, book: Manga, section: String) -> Bool {
        switch chosenfilter {
            case .title:
                return book.title.capitalized == section.capitalized
            case .mangaka:
                return book.mangakas.map({ $0.name.capitalized }).contains(section.capitalized)
            case .publisher:
                return book.publisher.capitalized == section.capitalized
            case .kind:
                return book.kinds.map({ $0.rawValue.capitalized }).contains(section.capitalized)
            case .category:
                return book.category.rawValue.capitalized == section.capitalized
        }
    }

    func deleteRow(indexSet: IndexSet) {
        mangaBooksCollection.remove(atOffsets: indexSet)
    }

    func getData() {
        firestore.collection("mangas").getDocuments { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                return print("🛑 API_FIRESTORE_MANAGER/GET_DATA: Not data: \(String(describing: error?.localizedDescription))")
            }

            self.mangaBooksCollection = snapshot.documents.map { snapshotDocument in
                return Manga(editionType: snapshotDocument["editionType"] as? Manga.EditionType ?? .manga,
                             category: snapshotDocument["category"] as? Category ?? .shonen,
                             kinds: snapshotDocument["kinds"] as? [Kind] ?? [],
                             title: snapshotDocument["title"] as? String ?? "",
                             volume: snapshotDocument["volume"] as? Int ?? 0,
                             cover: snapshotDocument["title"] as? String ?? "",
                             mangakas: snapshotDocument["mangakas"] as? [Mangaka] ?? [],
                             isbn: snapshotDocument["isbn"] as? Int ?? 0,
                             publisher: snapshotDocument["publisher"] as? String ?? "",
                             synopsis: snapshotDocument["synopsis"] as? String ?? "",
                             numberOfPages: snapshotDocument["numberOfPages"] as? Int ?? 0,
                             dimensions: snapshotDocument["dimensions"] as? String ?? "",
                             releaseDate: snapshotDocument["releaseDate"] as? String ?? "")
            }
        }
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
