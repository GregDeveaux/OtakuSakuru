//
//  ImageMangaAuthor.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import SwiftUI

struct ImageMangaAuthor: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(height: 120)
            .grayscale(1)
    }
}

struct MangaAuthorInImageCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImageMangaAuthor(image: Image("EiichiroOda"))
    }
}
