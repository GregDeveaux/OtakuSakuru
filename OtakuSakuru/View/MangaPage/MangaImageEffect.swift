//
//  MangaImageEffect.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 05/02/2023.
//

import SwiftUI

struct MangaImageEffect: View {
    var body: some View {
            // main image with parallax effect
        GeometryReader { geometry in
            ZStack {
                Image("OnePiece_VogueMerry")
                    .resizable()
                    .scaledToFill()

                Image("OnePieceLogoColor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 1/5)
                    .shadow(radius: 1.5, x: 2, y: 2)
            }
        }
        .frame(height: 500)
    }
}

struct MangaImageEffect_Previews: PreviewProvider {
    static var previews: some View {
        MangaImageEffect()
    }
}
