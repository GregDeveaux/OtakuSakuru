//
//  Mangaka.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import Foundation

    /// A mangaka is the job of creator, cartoonist and sciptwriter in the world of manga
struct Mangaka: Identifiable {

    var id: UUID = UUID()

    let name: String

        // -------------------------------------------------------------
        // MARK: - function
        // -------------------------------------------------------------

    let function: Function
    enum Function: String, CaseIterable, Identifiable {
        var id: Self {
                return self
            }

        case creator
        case cartoonist
        case scriptwriter
    }

        // -------------------------------------------------------------
        // MARK: - oeuvres
        // who can be either the whole collection or either by volume
        // -------------------------------------------------------------

    let mangas: [String]

//         -------------------------------------------------------------
//         MARK: - biography
//         -------------------------------------------------------------

    let age: Int? = nil
    let nationality: String? = nil
    let history: String?
}


    // -------------------------------------------------------------
    // MARK: - example Mangakas
    // -------------------------------------------------------------

extension Mangaka {
    static var example: [Mangaka] = [
        Mangaka(name: "Masashi Kishimoto",
                function: .creator,
                mangas: ["Naruto"],
                history: "Masashi Kishimoto est né le 8 novembre 1974 à Nagi un petit village situé dans la préfecture d'Okayama, au Japon1.\n\nDès son plus jeune âge Masashi se passionne pour le dessin, même si cela ne ressemblait qu'à des graffitis, du fait de son inexpérience. À force d'entraînement et de persévérance, ses dessins deviennent de plus en plus perfectionnés.\n\n Ses principaux modèles étaient les personnages de ses animés favoris, tirés des mangas de ses auteurs préférés, tels que Dragon Ball et Dr Slump d'Akira Toriyama, Kinnikuman de Yoshinori Kunai et Takashi Shimada2, mais aussi Doraemon de Hiroshi Fujimoto, ou Mobile Suit Gundam de Yoshiyuki Tomino et Hajime Yadate. Par ailleurs, le dessin n'étant pas sa seule passion, il aime beaucoup jouer aux jeux vidéo (grand fan de Akira Toriyama, il raconte dans les pages Bonus de Naruto son enfance et sa découverte du jeu vidéo Dragon Quest sur Famicom)3 et à la voiture télécommandée."),

        Mangaka(name: "Eiichiro Oda",
                function: .creator,
                mangas: ["One Piece"],
                history: "Eiichiro Oda est né le 1er janvier 1975 à Kumamoto (Japon). Dès l'âge de 4 ans, il veut devenir mangaka. En 1992, alors qu'il est encore au lycée, il est récompensé lors du 44e concours Tezuka pour Wanted !. Après avoir été assistant auprès de divers auteurs comme Nobuhiro Watsuki (l'auteur de Kenshin le vagabond), c'est en 1997 qu'Eiichiro Oda publie le premier chapitre de One Piece dans le magazine Shonen Jump.\n\nGrâce aux personnages attachants, aux scènes d'action dynamiques et au scénario émouvant qui la caractérisent, la série fait l'unanimité auprès d'un large public. En 2011, plus de 230 millions de mangas One Piece ont déjà été imprimés au Japon, où chaque nouveau volume est distribué à plus de 3 millions d'exemplaires. Ses déclinaisons en série TV, jeux vidéo ou films sont tout aussi populaires que la série originale./n/nOne Piece jouit également d'un succès international."),

        Mangaka(name: "Shou Hinata",
                function: .scriptwriter,
                mangas: ["One Piece"],
                history: "écrivain japonais"),

        Mangaka(name: "Buronson",
                function: .creator,
                mangas: ["Hokuto No Ken"],
                history: "Diplômé de l'École d'Aviation militaire du Japon en 1967, Yoshiyuki Okamura devient mécanicien radar pour l'armée de l'air japonaise qu'il quittera en 1969. Il rencontre Hiroshi Motomiya, mangaka en vogue depuis son premier succès en 1968, Otoko ippiki gaki daishō (男一匹ガキ大将?). Il engage alors Buronson comme assistant, et le pousse à écrire ses propres œuvres.\n\nC'est ainsi qu'en 1972 il commence sa carrière de scénariste avec Yō Hasebe et Gorō-kun tōjō (五郎君登場?, litt. « L'Entrée en scène du jeune Gorō »), suivent en 1973 et en 1974 Crime Sweeper (クライム・スイーパー, Kuraimu suīpā?) et Pink! Punch! Miyabi (ピンク!パンチ!雅, Pinku ! Panchu ! Miyabi?) avec Gorō Sakai, et son premier grand succès en 1975 : Doberman deka avec Shinji Hiramatsu.\n\nEn 1983, Shūeisha l'associe à un jeune dessinateur, Tetsuo Hara, et c'est ainsi que commence le phénomène Ken le Survivant, énorme succès au Japon qui sera d'ailleurs renouvelé en 2001 avec Ken - Fist of the Blue Sky.\n\nSes autres succès internationaux viendront de sa collaboration avec Ryōichi Ikegami, le dessinateur de Crying Freeman, avec les mangas Sanctuary, Odyssey, Strain, Heat puis Lord, dont il signe les scénarios. Tous deux reçoivent d'ailleurs en 2002 le Prix Shōgakukan catégorie générale de l'année 2002 pour Heat, précédant et succédant ainsi dans le palmarès à Naoki Urasawa1"),

        Mangaka(name: "Tetsuo Hara",
                function: .cartoonist,
                mangas: ["Hokuto No Ken"],
                history: "Il est atteint d'une déformation oculaire rare, la cornée conique, l'obligeant à fermer un œil pour dessiner et à reprendre à de multiples reprises ses dessins pour en rectifier les erreurs dues à la déformation de perspective que cela induit. Grâce à ces efforts, il parvient à fournir des dessins particulièrement bien réalisés."),

        Mangaka(name: "Atsushi Ohkubo",
                function: .creator,
                mangas: ["Fire force"],
                history: "Auparavant, il a été un des assistants de Rando Ayamine pour la série Get Backers pendant deux ans."),

        Mangaka(name: "One",
                function: .creator,
                mangas: ["One-Punch Man"],
                history: "ONE est un mystérieux artiste autodidacte qui possède un talent indéniable pour bousculer le lecteur. Autopublié sur Internet, il devient rapidement culte avec ses scénarios originaux et imprévisibles. Avec One-Punch Man, ONE détruit et reconstruit les codes classiques du manga avec brio et surprend le lecteur à chaque page."),

        Mangaka(name: "Yusuke Murata",
                function: .cartoonist,
                mangas: ["One-Punch Man"],
                history: "Yusuke Murata est notamment le mangaka de Eyeshield 21. En reprenant One-Punch Man, il donne une dimension plus professionnelle et parfaitement aboutie à la série, mettant son talent graphique au service d'un scénario totalement en marge./n/nReconnu par ses pairs comme l'un des meilleurs dessinateurs de sa génération, il a reçu plusieurs prix parmi lesquels le Prix Akatsuka et le Prix Hop Step.")
    ]
}
