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

}

enum SortFilter: String {
    case title
    case mangaka
    case publisher
    case kind
    case category
    case date
}


extension CollectionViewModel {

    func exampleData() -> [Book] {
        let books = [
            Book(editionType: .manga,
                 category: .shonen,
                 kind: [.action, .comedy, .adventure],
                 title: "Naruto",
                 volume: 8,
                 imageName: "Naruto_Tome8",
                 mangakas: [Mangaka(name: "Masashi Kishimoto", function: .creator)],
                 ISBN: 9782505115021,
                 publisher: "Kana",
                 synopsis: "En compagnie de Sasuke et de Sakura, Naruto, le pire garnement de l'école des ninjas du village caché de Konoha, poursuit son apprentissage.Lors de l'examen de sélection des ninjas de « moyenne classe », ils se font attaquer dans « la forêt de la mort », par un mystérieux ninja, nommé Orochimaru, qui dépose une marque maléfique sur le corps de Sasuke avant de disparaître.Naruto et Sasuke, qui se sont imposés dans les phases qualificatives de la troisième épreuve, avancent vers la finale.Alors que le combat entre Sasuke et...",
                 numberOfPages: 380,
                 dimensions: "140 mm x 210 mm",
                 releaseDate: "03/02/2023",
                 isAcquired: true),
            Book(editionType: .novel,
                 category: .shonen,
                 kind: [.action, .comedy, .adventure],
                 title: "One Piece",
                 volume: 1,
                 imageName: "OnePiece-Novel",
                 mangakas: [Mangaka(name: "Eiichiro Oda", function: .creator),
                            Mangaka(name: "Shou Hinata", function: .scriptwriter)],
                 ISBN: 9782344038796,
                 publisher: "Glénat",
                 synopsis: "Des années avant que Luffy ne prenne la mer, découvrez comment Ace s’est constitué son équipage… et comment il a acquis les pouvoirs du pyro-fruit !",
                 numberOfPages: 270,
                 dimensions: "115 x 180 mm",
                 releaseDate: "03/02/2023",
                 isAcquired: true),
            Book(editionType: .manga,
                 category: .seinen,
                 kind: [.action, .adventure, .drama, .sciFi],
                 title: "HokutoNoKen",
                 volume: 5,
                 imageName: "HokutoNoKen_Tome5",
                 mangakas: [Mangaka(name: "Eiichiro Oda", function: .creator),
                            Mangaka(name: "Shou Hinata", function: .scriptwriter)],
                 ISBN: 9782820345950,
                 publisher: "Glénat",
                 synopsis: "Des années avant que Luffy ne prenne la mer, découvrez comment Ace s’est constitué son équipage… et comment il a acquis les pouvoirs du pyro-fruit !",
                 numberOfPages: 270,
                 dimensions: "115 x 180 mm",
                 releaseDate: "03/02/2023",
                 isAcquired: true),
            Book(editionType: .manga,
                 category: .shonen,
                 kind: [.action, .adventure],
                 title: "Fire force",
                 volume: 27,
                 imageName: "FireForce_Tome27",
                 mangakas: [Mangaka(name: "Atsushi Ohkubo", function: .creator)],
                 ISBN: 9782505117223,
                 publisher: "Kana",
                 synopsis: "Quel destin Shinra porte-t-il donc sur ses épaules ? Et quelle est la vérité sur sa naissance et celle de son frère Shô ? Alors que ce dernier, accompagné d'Arrow, mène une enquête sur le mystérieux secret concernant sa famille, il retrouve, par le biais de l'Adora Link, sa mère Mari devenue une Torche humaine. Quelle décision le jeune homme va-t-il prendre après avoir découvert toute la vérité ?! Au même moment…",
                 numberOfPages: 192,
                 dimensions: "115 mm x 175 mm",
                 releaseDate: "03/02/2023",
                 isAcquired: true)
        ]
        return books
    }
}

