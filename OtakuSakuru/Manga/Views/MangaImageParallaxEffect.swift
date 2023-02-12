//
//  MangaImageParallaxEffect.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 05/02/2023.
//

import SwiftUI

    // main image with parallax effect
struct MangaImageParallaxEffect: View {
    var body: some View {
            // use geometry to place all image and the logo
        GeometryReader { geometry in
            ZStack {
                // Parallax image
                Image("OnePiece_VogueMerry")
                    .resizable()
                    .scaledToFill()
                
                // logo Manga
                Image("OnePieceLogoColor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 1/5)
                    .shadow(radius: 1.5, x: 2, y: 2)
            }
        }
            // height of Image
        .frame(height: 500)
    }
}

struct MangaImageParallaxEffect_Previews: PreviewProvider {
    static var previews: some View {
        MangaImageParallaxEffect()
    }
}
