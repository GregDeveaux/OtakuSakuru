//
//  Book.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

    // The book is a volume of one manga or artbook(draws) or guidebook(characters info) or novel
struct Book: Identifiable {

    var id: Int {
        return ISBN
    }

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

    let kinds: [Kind]

        // -------------------------------------------------------------
        // MARK: - description
        // -------------------------------------------------------------

    /// book
    var title: String
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
        case toRead = "À lire"
        case nowPlaying = "En cours de lecture"
        case read = "Déjà lu"
        case pause = "En pause"
        case readingCanceled = "Bof !, j'arrête de le lire"
    }
}


    // -------------------------------------------------------------
    // MARK: - example books
    // -------------------------------------------------------------
extension Book {
    static var example: [Book] = [
        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "Naruto",
             volume: 8,
             imageName: "Naruto_Tome8",
             mangakas: Mangaka.example.filter({ $0.mangas == ["Naruto"] }),
             ISBN: 9782505115021,
             publisher: "Kana",
             synopsis: "En compagnie de Sasuke et de Sakura, Naruto, le pire garnement de l'école des ninjas du village caché de Konoha, poursuit son apprentissage.Lors de l'examen de sélection des ninjas de « moyenne classe », ils se font attaquer dans « la forêt de la mort », par un mystérieux ninja, nommé Orochimaru, qui dépose une marque maléfique sur le corps de Sasuke avant de disparaître.Naruto et Sasuke, qui se sont imposés dans les phases qualificatives de la troisième épreuve, avancent vers la finale.Alors que le combat entre Sasuke et...",
             numberOfPages: 380,
             dimensions: "140 mm x 210 mm",
             releaseDate: "02/2023",
             isAcquired: true,
             readStatus: .nowPlaying),

        Book(editionType: .novel,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece - Ace",
             volume: 1,
             imageName: "OnePiece-Novel",
             mangakas: Mangaka.example.filter({ $0.mangas == ["One Piece - Ace"] }),
             ISBN: 9782344038796,
             publisher: "Glénat",
             synopsis: "Des années avant que Luffy ne prenne la mer, découvrez comment Ace s’est constitué son équipage… et comment il a acquis les pouvoirs du pyro-fruit !",
             numberOfPages: 270,
             dimensions: "115 x 180 mm",
             releaseDate: "02/2022",
             isAcquired: true,
             readStatus: .pause),

        Book(editionType: .manga,
             category: .seinen,
             kinds: [.action, .adventure, .drama, .sciFi],
             title: "Hokuto No Ken",
             volume: 5,
             imageName: "HokutoNoKen_Tome5",
             mangakas: Mangaka.example.filter({ $0.mangas == ["Hokuto No Ken"] }),
             ISBN: 9782820345950,
             publisher: "Crunchyroll",
             synopsis: "Des années avant que Luffy ne prenne la mer, découvrez comment Ace s’est constitué son équipage… et comment il a acquis les pouvoirs du pyro-fruit !",
             numberOfPages: 270,
             dimensions: "115 x 180 mm",
             releaseDate: "06/2022",
             isAcquired: true,
             readStatus: .nowPlaying),

        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 1,
             imageName: "OnePiece-Manga-Tome1",
             mangakas: Mangaka.example.filter({ $0.mangas == ["One Piece"] }),
             ISBN: 9782723488525,
             publisher: "Glénat",
             synopsis: "Le roi des pirates, ce sera lui ! Nous sommes à l'ère des pirates. Luffy, un garçon espiègle, rêve de devenir le roi des pirates en trouvant le \"One Piece\", un fabuleux trésor. Seulement, Luffy a avalé un fruit du démon qui l'a transformé en homme élastique. Depuis, il est capable de contorsionner son corps dans tous les sens, mais il a perdu la faculté de nager. Avec l'aide de ses précieux amis, il va devoir affronter de redoutables pirates dans des aventures toujours plus rocambolesques./n/nÉgalement adapté en dessin animé pour la télévision et le cinéma, One Piece remporte un formidable succès à travers le monde. Les aventures de Luffy au chapeau de paille ont désormais gagné tous les lecteurs, qui se passionnent chaque trimestre pour les aventures exceptionnelles de leurs héros.",
             numberOfPages: 203,
             dimensions: "11,5 cm × 18,0 cm × 1,6 cm",
             releaseDate: "03/07/2013",
             isAcquired: true,
             readStatus: .read),

        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 2,
             imageName: "OnePiece-Manga-Tome2",
             mangakas: Mangaka.example.filter({ $0.mangas == ["One Piece"] }),
             ISBN: 9782723489898,
             publisher: "Glénat",
             synopsis: "Luffy fait la connaissance de Nami, une ravissante jeune fille maîtrisant la navigation. Seulement, Nami déteste les pirates et refuse d'entrer dans son équipage. Pire, elle fait prisonnier Luffy, pour le livrer au terrible... Baggy le clown !",
             numberOfPages: 192,
             dimensions: "11,5 cm × 18,0 cm × 1,6 cm",
             releaseDate: "03/07/2013",
             isAcquired: true,
             readStatus: .read),

        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 9,
             imageName: "OnePiece-Manga-Tome9",
             mangakas: Mangaka.example.filter({ $0.mangas == ["One Piece"] }),
             ISBN: 9782723492539,
             publisher: "Glénat",
             synopsis: "A la poursuite de Nami, Luffy et son équipage arrivent à Arlong Park, sur les terres des hommes-poissons. C'est là qu'ils en apprendront plus sur le surprenant passé de leur navigatrice ! Dans la bataille solitaire qu'elle mène depuis si longtemps, Nami saura-t-elle reconnaître ses vrais amis ?",
             numberOfPages: 204,
             dimensions: "115 x 180 mm",
             releaseDate: "03/07/2013",
             isAcquired: true,
             readStatus: .read),

        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 100,
             imageName: "OnePiece-Manga-Tome100",
             mangakas: Mangaka.example.filter({ $0.mangas == ["One Piece"] }),
             ISBN: 9782344049020,
             publisher: "Glénat",
             synopsis: "Alors que les germes d'un grand conflit mondial se font de plus en plus prégnants, Luffy et son équipage poursuivent leur folle aventure à la recherche du One Piece. Quels adversaires se dresseront face à eux ? Quels alliés parviendront-ils à découvrir ? Quels secrets révéleront-ils ? Vous le saurez en lisant ce tome 100, proposé à la fois en version normale et en version collector.",
             numberOfPages: 208,
             dimensions: "11,8 cm × 18,2 cm × 1,3 cm",
             releaseDate: "08/12/2021",
             isAcquired: true,
             readStatus: .read),

        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One-Punch Man",
             volume: 13,
             imageName: "OnePunchMan_Tome13",
             mangakas: Mangaka.example.filter({ $0.mangas == ["One-Punch Man"] }),
             ISBN: 9782368525586,
             publisher: "Kurokawa",
             synopsis: "Alors que les héros de classe A sont impuissants face à l'énorme pieuvre Léviatank, le classe S Flashy Flash arrive en renfort et se joint au combat. Quel est donc le dessein de l'Organisation des monstres qui semble tout à coup passer à la vitesse supérieure ? Pendant ce temps, la finale du tournoi d'arts martiaux est sur le point de commencer ! !",
             numberOfPages: 208,
             dimensions: "11,8 cm × 17,9 cm × 1,7 cm",
             releaseDate: "06/12/2018",
             isAcquired: true,
             readStatus: .nowPlaying),

        Book(editionType: .manga,
             category: .seinen,
             kinds: [.action, .adventure, .drama, .sciFi],
             title: "Hokuto No Ken",
             volume: 1,
             imageName: "HokutoNoKen_Tome1",
             mangakas: Mangaka.example.filter({ $0.mangas == ["Hokuto No Ken"] }),
             ISBN: 9782820344885,
             publisher: "Crunchyroll",
             synopsis: "An 199X... La Terre a été consumée par l'enfer des flammes atomiques pour se changer en un monde de violence et de mort. Le dernier espoir de l'Humanité réside dans les poings d'un seul homme, au torse orné de sept cicatrices. L'affrontement entre Hokuto Shinken et Nanto Seiken s'apprête à entrer dans la légende...",
             numberOfPages: 304,
             dimensions: "13,0 cm × 18,0 cm × 2,6 cm",
             releaseDate: "12/10/2022",
             isAcquired: true,
             readStatus: .nowPlaying),

        Book(editionType: .manga,
             category: .shonen,
             kinds: [.action, .adventure],
             title: "Fire Force",
             volume: 27,
             imageName: "FireForce_Tome27",
             mangakas: Mangaka.example.filter({ $0.mangas == ["Fire force"] }),
             ISBN: 9782505117223,
             publisher: "Kana",
             synopsis: "Quel destin Shinra porte-t-il donc sur ses épaules ? Et quelle est la vérité sur sa naissance et celle de son frère Shô ? Alors que ce dernier, accompagné d'Arrow, mène une enquête sur le mystérieux secret concernant sa famille, il retrouve, par le biais de l'Adora Link, sa mère Mari devenue une Torche humaine. Quelle décision le jeune homme va-t-il prendre après avoir découvert toute la vérité ?! Au même moment…",
             numberOfPages: 192,
             dimensions: "115 mm x 175 mm",
             releaseDate: "01/2023",
             isAcquired: true,
             readStatus: .read)
    ]
}
