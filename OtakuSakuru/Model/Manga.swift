//
//  Manga.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import Foundation

/// A manga is the whole oeuvre
struct Manga: Identifiable {

    let id = UUID()

        // -------------------------------------------------------------
        // MARK: - design identity
        // -------------------------------------------------------------

    let title: String
    let imageLogoName: String       // logo of the title

    let imagesDrawName: [String]    // presentation images of Manga for carousel

    let mangakas: [Mangaka]
    let story: String

        // -------------------------------------------------------------
        // MARK: - favorite/notation
        // -------------------------------------------------------------

    var starRatingWholeUser: Double = 0          // for whole notation of the app users (different with book)
    var isFavorite: Bool = false                 // for the user (different with book)

        // categories according to the age
    let categories: Category

        // literature kinds
    let kinds: [Kind]

        // release status
    var releaseStatus: State
    enum State: String, CaseIterable {
        case inProgress = "In progress"
        case novelty
        case stopPublished
        case comingSoon
    }

        // -------------------------------------------------------------
        // MARK: - books with the Manga title
        // -------------------------------------------------------------

    let books: [Book]!
}

enum Category: String {
    case kodomo                 // for kids - age: +3
    case shonen = "Shōnen"      // for male - age: +7
    case shojo = "Shōjo"        // for female - age: +7
    case seinen                 // for male - age: +14
    case seijin                 // for female - age: +14
    case josei                  // for all - age: +18
}

enum Kind: String, CaseIterable {
    case action
    case adventure
    case comedy
    case drama
    case ecchi
    case fantasy
    case hentai
    case horror
    case mahouShoujo = "Mahou Shoujo"
    case mecha
    case music
    case mystery
    case psychological
    case romance
    case sciFi = "Sci-Fi"
    case sliceOfLife = "Slice of life"
    case sports
    case supernatural
    case thriller
}


    // -------------------------------------------------------------
    // MARK: - example Mangas
    // -------------------------------------------------------------

var exampleMangas: [Manga] = [
    Manga(title: "Naruto",
          imageLogoName: "LogoNaruto",
          imagesDrawName: [],
          mangakas: exampleMangakas.filter({ $0.mangas == ["Naruto"] }),
          story: "L'histoire commence pendant l'adolescence de Naruto, vers ses douze ans. Orphelin cancre et grand farceur, il fait toutes les bêtises possibles pour se faire remarquer. Son rêve : devenir le meilleur Hokage afin d'être reconnu par les habitants de son village. En effet, le démon renard à neuf queues scellé en lui a attisé la crainte et le mépris des autres villageois, qui, avec le temps, ne font plus de différence entre Kyûbi et Naruto. Malgré cela, Naruto s'entraîne dur afin de devenir genin, le premier niveau chez les ninjas. Après avoir raté l'examen genin 3 fois, il arrive finalement à recevoir son bandeau frontal de Konoha. Il est alors inclus dans une équipe de trois apprentis ninjas, avec Sakura Haruno et le talentueux Sasuke Uchiwa qui veut venger les personnes chères à ses yeux, en tuant son frère Itachi Uchiwa. Peu après, ils rencontrent leur jōnin (ninja de classe supérieure), celui qui s'occupera de leur formation : le mystérieux Kakashi Hatake./n/nAu début craint et méprisé par ses pairs, Naruto va peu à peu monter en puissance et gagner le respect et l'affection des villageois grâce, notamment, aux combats dantesques qu'il remportera face aux ennemis les plus puissants du monde ninja.",
          starRatingWholeUser: 4.5,
          isFavorite: true,
          categories: .shonen,
          kinds: [.action, .comedy, .adventure],
          releaseStatus: .stopPublished,
          books: exampleBooks.filter({ $0.title == "Naruto" })),
    
    Manga(title: "One Piece",
          imageLogoName: "OnePieceLogoColor",
          imagesDrawName: [],
          mangakas: exampleMangakas.filter({ $0.mangas == ["One Piece"] }),
          story: "L'histoire de One Piece se déroule dans un monde fictif dominé par les océans, où certains pirates aspirent à une ère de liberté et d'aventure connue comme « l'âge d'or de la piraterie ». Cette époque fut inaugurée à la suite des derniers mots prononcés par le roi des pirates, Gol D. Roger, surnommé Gold Roger avant son exécution2. Roger annonce au monde que ses habitants étaient libres de chercher toutes les richesses qu'il avait accumulées durant sa vie entière, le « One Piece3. »/n/nVingt-deux ans après l'exécution de Roger, l'intérêt pour le One Piece s’effrite. Beaucoup y ont renoncé, certains se demandent même s'il existe vraiment. Même si les pirates sont toujours une menace pour les habitants, la Marine est devenue plus efficace pour contrer leurs attaques sur les quatre mers : East Blue, North Blue, West Blue et South Blue. Pourtant, ce changement n'a pas dissuadé Monkey D. Luffy, un jeune garçon, de vouloir devenir le successeur du légendaire Roger. Il va ainsi partir à l’aventure en se donnant comme premier objectif de créer un équipage afin de rejoindre la mer de Grand Line, où la fièvre de la « grande vague de piraterie » continue de sévir, et où de nombreux grands noms de la piraterie sont à la poursuite du One Piece, supposé être sur la dernière île de cette grande mer, Laugh Tale (orthographe voulue par Oda)./n/nLuffy part à l'aventure après sa rencontre avec Shanks le Roux, le capitaine d'un navire de pirates qui a passé un an dans son village et l'a sauvé d'un monstre marin en sacrifiant son bras gauche. Depuis, Luffy porte son chapeau de paille qu'il lui a offert pour marquer la promesse de devenir un grand pirate. Ce chapeau deviendra donc le symbole de son équipage. C'est à cette époque qu'il mange un fruit du démon que détenait Shanks : le fruit du Gum Gum, et qui rend son corps élastique. Les fruits du Démon une fois mangés donnent des capacités spéciales à leur détenteur, qui perd par la même occasion toutes ses forces lorsqu'il est immergé dans l'eau de mer, c'est une malédiction. Luffy et son équipage feront de nombreuses rencontres qui renforceront leur amitié et élargiront leur équipage. Mais ils devront se confronter aux équipages pirates prônant violence et pouvoirs, ainsi qu'à la Marine et ses soldats, garants de la justice.",
          starRatingWholeUser: 5.0,
          isFavorite: true,
          categories: .shonen,
          kinds: [.action, .comedy, .adventure],
          releaseStatus: .inProgress,
          books: exampleBooks.filter({ $0.title == "One Piece" })),

    Manga(title: "Hokuto No Ken",
          imageLogoName: "OnePieceLogoColor",
          imagesDrawName: [],
          mangakas: exampleMangakas.filter({ $0.mangas == ["Hokuto No Ken"] }),
          story: "L'histoire se déroule dans les années 1990 (ce qui était alors un futur relativement proche), sur une terre ravagée par une guerre nucléaire, ayant eu pour conséquence l'évaporation de la plupart des mers et océans, tout comme la destruction d’une grande partie de la végétation. Lors de l'introduction de la série animée on peut lire « 199X », soit une année indéterminée à la fin du xxe siècle2. Dans cet univers post-apocalyptique, les survivants sont soit d'humbles villageois s'efforçant de survivre, soit des bandits vicieux regroupés en gangs qui s'adonnent au pillage et à la persécution des villageois./n/nCependant, un expert en arts martiaux nommé Kenshiro, dit Ken, un homme reconnaissable aux sept cicatrices qu'il porte sur le torse (formant la constellation de la Grande Ourse), a été choisi pour devenir le successeur d'une légendaire école d'art martial assassin, le Hokuto Shinken (北斗神拳?, l'art divin de l'Étoile du Nord), dont la technique consiste à presser les points vitaux de l'adversaire pour le faire exploser de l'intérieur. Au début de l'aventure, Ken, homme blessé, ne cherche pas réellement à aider les villageois, mais au fur et à mesure que son étoile le guide, il se révèle comme étant le sauveur tant attendu par une population au bord du désespoir. Accompagné dans son périple par deux jeunes enfants nommés Bart et Lynn, Ken sera confronté à un grand nombre de gangs et devra affronter deux de ses frères adoptifs, eux aussi disciples de l'art du Hokuto Shinken, et se mesurer à cinq des six maîtres de l'école concurrente Nanto Seiken (南斗聖拳?, le poing sacré de l'Étoile du Sud)./n/nAvant de rencontrer Raoh, ultime adversaire, aîné des 4 frères du Hokuto et conquérant de la fin des temps qui a enfreint les lois de Hokuto en refusant d'abandonner son art à la suite de la désignation de Kenshiro comme unique héritier puis en employant son art pour régner par la terreur, Kenshiro doit faire face à une série de tragédies qui l'affectent profondément (disparitions de sa fiancée, mort de ses frères d'armes, massacres d'innocents…)3./n/nPlusieurs années après la mort de Raoh et de Yuria (Julia en version française), Ken effectue une seconde venue pour prêter main-forte à Bart et Lynn, maintenant adultes et leaders de l'armée du Hokuto, milice rebelle contre la tyrannie des troupes de l'Empereur céleste, commandées par un régent nommé le Gouverneur Jakoh. Ken se mesure alors aux maîtres de l'école Gento Kokken. Après la défaite finale de Jakoh, Lynn est enlevée et Ken doit traverser le seul océan restant pour se rendre sur les terres de Shura (修羅の国, Shura no Kuni?), connues aussi sous le nom de Pays des démons. Les Terres de Shura ne sont autres que le lieu naissance de Raoh, Toki et Kenshiro. Ce pays est gouverné par Kaioh, le frère biologique de Raoh, qui est aussi dépositaire du Hokuto Ryūken (北斗琉拳, Le poing du dragon de l'étoile du nord?), une branche déviante et maléfique du Hokuto./n/nAprès avoir retrouvé le secret du Hokuto originel (Hokuto Sōke), Ken vainc le mal de Kaioh, sauve Lynn et libère le pays des démons. Enfin, Ken retrouve Ryu, le fils de Raoh, et le prend comme disciple pour faire de lui son successeur4. Dans l'animation, la fin diffère en ce sens que Ken, pensant avoir mis fin à la tragédie du Hokuto, fait une rétrospective de sa vie, du sens de ses rencontres et de ses combats, puis disparaît avec Kokuo en se promettant de se battre tant qu'il resterait des adversaires dignes de lui.",
          starRatingWholeUser: 5.0,
          isFavorite: true,
          categories: .seinen,
          kinds: [.action, .adventure, .drama, .sciFi],
          releaseStatus: .inProgress,
          books: exampleBooks.filter({ $0.title == "Hokuto No Ken" })),

    Manga(title: "Fire force",
          imageLogoName: "LogoFireForce",
          imagesDrawName: [],
          mangakas: exampleMangakas.filter({ $0.mangas == ["Fire force"] }),
          story: "En l'an 198 du calendrier solaire, le monde fait face au phénomène de combustion humaine où l'humanité peut s'enflammer sans prévenir et se transformer en « torche humaine » (焰ビト, Homura Bito?). Les membres des brigades spéciales Fire Force du royaume de Tokyo cherchent à découvrir les raisons de ce phénomène et parmi eux se trouve Shinra Kusakabe, surnommé « le démon », qui intègre la 8e brigade pour éradiquer le phénomène de combustion humaine et découvrir la vérité sur l'incendie ayant coûté la vie à sa mère et son frère, il y a douze ans.",
          starRatingWholeUser: 4.0,
          isFavorite: true,
          categories: .shonen,
          kinds: [.action, .comedy, .adventure],
          releaseStatus: .inProgress,
          books: exampleBooks.filter({ $0.title == "Fire force" })),

    Manga(title: "One-Punch Man",
          imageLogoName: "LogoOnePunchMan",
          imagesDrawName: [],
          mangakas: exampleMangakas.filter({ $0.mangas == ["One-Punch Man"] }),
          story: "Saitama est un jeune homme sans emploi, déprimé et sans but profond dans sa vie. Un jour, il rencontre un homme-crabe qui recherche un jeune garçon « avec un menton fendu comme un cul » selon ses termes. Saitama finit par rencontrer ce jeune garçon et décide de le sauver de l'homme-crabe, qu'il arrive à battre difficilement. Dès lors, Saitama décide de devenir un super-héros et s’entraîne pendant trois ans très sérieusement : 100 pompes, 100 squats, 100 abdos et 10 km de course au quotidien et il n'y a pas de conditions de chauffage ni de climatisation . À la fin de son entrainement « si intense qu'il en perd ses cheveux », il remarque qu'il est devenu tellement fort qu'il parvient désormais à battre tous ses adversaires d'un seul coup de poing. Sa force démesurée est pour lui source de problèmes, puisqu'il ne trouve pas d'adversaires à sa taille et s'ennuie dans son métier de héros car les combats ne lui procurent plus aucune sensation ni aucune adrénaline... Bien qu'il ait mis un terme à un bon nombre de menaces toutes plus dangereuses les unes que les autres, personne ne semble remarquer l'incroyable capacité de Saitama, à l'exception de son ami et disciple Genos, un jeune homme devenu cyborg.",
          starRatingWholeUser: 5.0,
          isFavorite: true,
          categories: .shonen,
          kinds: [.action, .comedy, .adventure],
          releaseStatus: .inProgress,
          books: exampleBooks.filter({ $0.title == "One-Punch Man" }))
    
]
