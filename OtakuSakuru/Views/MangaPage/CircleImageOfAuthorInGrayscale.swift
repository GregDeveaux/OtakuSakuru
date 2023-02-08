//
//  CircleImageOfAuthorInGrayscale.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import SwiftUI

struct CircleImageOfAuthorInGrayscale: View {
    var image: Image

    var body: some View {
            // create an image
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(height: 120)
            .grayscale(1)
    }
}

struct CircleImageOfAuthorInGrayscale_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageOfAuthorInGrayscale(image: Image("EiichiroOda"))
    }
}
