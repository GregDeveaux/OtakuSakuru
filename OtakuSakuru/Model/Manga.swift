//
//  Manga.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation
import FirebaseFirestoreSwift

    // The book is a volume of one manga or artbook(draws) or guidebook(characters info) or novel
struct Manga: Identifiable, Codable {

    var id: Int {
        return isbn
    }

        // -------------------------------------------------------------
        // MARK: - categories
        // -------------------------------------------------------------

    let editionType: EditionType
    enum EditionType: String, Codable {
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
    let cover: String
    let mangakas: [Mangaka]
    
    /// published
    let isbn: Int
    let publisher: String
    let synopsis: String
    let numberOfPages: Int
    let dimensions: String
    let releaseDate: String
    var price: Double? = nil

        // -------------------------------------------------------------
        // MARK: - status of published
        // -------------------------------------------------------------

    var state: State = .inProgress
    enum State: String, CaseIterable, Codable {
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
    var acquisitionDate: Date? = nil
    var isAcquired: Bool = false {
        didSet {
            if acquisitionDate != nil {
                isAcquired = true
            }
        }
    }

    var totalNumberOfUsersWhoAcquiredIt: Int = 0

         // follow the book to know if published
    var followUp: Bool = false

        // state to read of user for the profil
    var readStatus: UserReadingStatus = .toRead
    enum UserReadingStatus: String, CaseIterable, Codable {
        case toRead = "?? lire"
        case nowPlaying = "En cours de lecture"
        case read = "D??j?? lu"
        case pause = "En pause"
        case readingCanceled = "Bof !, j'arr??te de le lire"
    }
}


    // -------------------------------------------------------------
    // MARK: - example books
    // -------------------------------------------------------------
extension Manga {
    static var example: [Manga] = [
        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "Naruto",
             volume: 8,
             cover: "Naruto_Tome8",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("Naruto")}),
             isbn: 9782505115021,
             publisher: "Kana",
             synopsis: "Naruto, Sasuke et Sakura ont brillamment pass?? la deuxi??me ??preuve et s'appr??tent maintenant ?? entamer la troisi??me. Mais avant cela, il y aura une pr??-s??lection ! Kabuto vient de d??clarer forfait... 20 candidats, parmi les plus dou??s, vont s'affronter dans une s??rie de duels au sommet !!",
             numberOfPages: 380,
             dimensions: "140 mm x 210 mm",
             releaseDate: "03/02/2023",
             isAcquired: true,
             readStatus: .nowPlaying),

        Manga(editionType: .novel,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece - Ace",
             volume: 1,
             cover: "OnePiece-Novel",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("One Piece - Ace") }),
             isbn: 9782344038796,
             publisher: "Gl??nat",
             synopsis: "Des ann??es avant que Luffy ne prenne la mer, d??couvrez comment Ace s???est constitu?? son ??quipage??? et comment il a acquis les pouvoirs du pyro-fruit !",
             numberOfPages: 270,
             dimensions: "115 x 180 mm",
             releaseDate: "02/2022",
             isAcquired: true,
             readStatus: .pause),

        Manga(editionType: .manga,
             category: .seinen,
             kinds: [.action, .adventure, .drama, .sciFi],
             title: "Hokuto No Ken",
             volume: 5,
             cover: "HokutoNoKen_Tome5",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("Hokuto No Ken") }),
             isbn: 9782820345950,
             publisher: "Crunchyroll",
             synopsis: "Des ann??es avant que Luffy ne prenne la mer, d??couvrez comment Ace s???est constitu?? son ??quipage??? et comment il a acquis les pouvoirs du pyro-fruit !",
             numberOfPages: 270,
             dimensions: "115 x 180 mm",
             releaseDate: "06/2022",
             isAcquired: true,
             readStatus: .nowPlaying),

        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 1,
             cover: "OnePiece-Manga-Tome1",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("One Piece") }),
             isbn: 9782723488525,
             publisher: "Gl??nat",
             synopsis: "Le roi des pirates, ce sera lui ! Nous sommes ?? l'??re des pirates. Luffy, un gar??on espi??gle, r??ve de devenir le roi des pirates en trouvant le \"One Piece\", un fabuleux tr??sor. Seulement, Luffy a aval?? un fruit du d??mon qui l'a transform?? en homme ??lastique. Depuis, il est capable de contorsionner son corps dans tous les sens, mais il a perdu la facult?? de nager. Avec l'aide de ses pr??cieux amis, il va devoir affronter de redoutables pirates dans des aventures toujours plus rocambolesques./n/n??galement adapt?? en dessin anim?? pour la t??l??vision et le cin??ma, One Piece remporte un formidable succ??s ?? travers le monde. Les aventures de Luffy au chapeau de paille ont d??sormais gagn?? tous les lecteurs, qui se passionnent chaque trimestre pour les aventures exceptionnelles de leurs h??ros.",
             numberOfPages: 203,
             dimensions: "11,5 cm ?? 18,0 cm ?? 1,6 cm",
             releaseDate: "03/07/2013",
             isAcquired: true,
             readStatus: .read),

        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 2,
             cover: "OnePiece-Manga-Tome2",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("One Piece") }),
             isbn: 9782723489898,
             publisher: "Gl??nat",
             synopsis: "Luffy fait la connaissance de Nami, une ravissante jeune fille ma??trisant la navigation. Seulement, Nami d??teste les pirates et refuse d'entrer dans son ??quipage. Pire, elle fait prisonnier Luffy, pour le livrer au terrible... Baggy le clown !",
             numberOfPages: 192,
             dimensions: "11,5 cm ?? 18,0 cm ?? 1,6 cm",
             releaseDate: "03/07/2013",
             isAcquired: true,
             readStatus: .read),

        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 9,
             cover: "OnePiece-Manga-Tome9",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("One Piece") }),
             isbn: 9782723492539,
             publisher: "Gl??nat",
             synopsis: "A la poursuite de Nami, Luffy et son ??quipage arrivent ?? Arlong Park, sur les terres des hommes-poissons. C'est l?? qu'ils en apprendront plus sur le surprenant pass?? de leur navigatrice ! Dans la bataille solitaire qu'elle m??ne depuis si longtemps, Nami saura-t-elle reconna??tre ses vrais amis ?",
             numberOfPages: 204,
             dimensions: "115 x 180 mm",
             releaseDate: "03/07/2013",
             isAcquired: true,
             readStatus: .read),

        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One Piece",
             volume: 100,
             cover: "OnePiece-Manga-Tome100",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("One Piece") }),
             isbn: 9782344049020,
             publisher: "Gl??nat",
             synopsis: "Alors que les germes d'un grand conflit mondial se font de plus en plus pr??gnants, Luffy et son ??quipage poursuivent leur folle aventure ?? la recherche du One Piece. Quels adversaires se dresseront face ?? eux ? Quels alli??s parviendront-ils ?? d??couvrir ? Quels secrets r??v??leront-ils ? Vous le saurez en lisant ce tome 100, propos?? ?? la fois en version normale et en version collector.",
             numberOfPages: 208,
             dimensions: "11,8 cm ?? 18,2 cm ?? 1,3 cm",
             releaseDate: "08/12/2021",
             isAcquired: true,
             readStatus: .read),

        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .comedy, .adventure],
             title: "One-Punch Man",
             volume: 13,
             cover: "OnePunchMan_Tome13",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("One-Punch Man") }),
             isbn: 9782368525586,
             publisher: "Kurokawa",
             synopsis: "Alors que les h??ros de classe A sont impuissants face ?? l'??norme pieuvre L??viatank, le classe S Flashy Flash arrive en renfort et se joint au combat. Quel est donc le dessein de l'Organisation des monstres qui semble tout ?? coup passer ?? la vitesse sup??rieure ? Pendant ce temps, la finale du tournoi d'arts martiaux est sur le point de commencer ! !",
             numberOfPages: 208,
             dimensions: "11,8 cm ?? 17,9 cm ?? 1,7 cm",
             releaseDate: "06/12/2018",
             isAcquired: true,
             readStatus: .nowPlaying),

        Manga(editionType: .manga,
             category: .seinen,
             kinds: [.action, .adventure, .drama, .sciFi],
             title: "Hokuto No Ken",
             volume: 1,
             cover: "HokutoNoKen_Tome1",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("Hokuto No Ken") }),
             isbn: 9782820344885,
             publisher: "Crunchyroll",
             synopsis: "An 199X... La Terre a ??t?? consum??e par l'enfer des flammes atomiques pour se changer en un monde de violence et de mort. Le dernier espoir de l'Humanit?? r??side dans les poings d'un seul homme, au torse orn?? de sept cicatrices. L'affrontement entre Hokuto Shinken et Nanto Seiken s'appr??te ?? entrer dans la l??gende...",
             numberOfPages: 304,
             dimensions: "13,0 cm ?? 18,0 cm ?? 2,6 cm",
             releaseDate: "12/10/2022",
             isAcquired: true,
             readStatus: .nowPlaying),

        Manga(editionType: .manga,
             category: .shonen,
             kinds: [.action, .adventure],
             title: "Fire Forc8",
             volume: 27,
             cover: "FireForce_Tome27",
             mangakas: Mangaka.example.filter({ $0.mangas.contains("Fire force") }),
             isbn: 9782505117223,
             publisher: "Kana",
             synopsis: "Quel destin Shinra porte-t-il donc sur ses ??paules ? Et quelle est la v??rit?? sur sa naissance et celle de son fr??re Sh?? ? Alors que ce dernier, accompagn?? d'Arrow, m??ne une enqu??te sur le myst??rieux secret concernant sa famille, il retrouve, par le biais de l'Adora Link, sa m??re Mari devenue une Torche humaine. Quelle d??cision le jeune homme va-t-il prendre apr??s avoir d??couvert toute la v??rit?? ?! Au m??me moment???",
             numberOfPages: 192,
             dimensions: "115 mm x 175 mm",
             releaseDate: "01/2023",
             isAcquired: true,
             readStatus: .read)
    ]
}
