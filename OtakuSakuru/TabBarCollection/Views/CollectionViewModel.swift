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

    @Published var mangasOfUser: [Manga] = []

}

enum SortFilter: String, CaseIterable {
    case title
    case mangaka
    case publisher
    case kind
    case category
    case date
}
