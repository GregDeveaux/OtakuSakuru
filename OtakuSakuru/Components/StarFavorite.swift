//
//  StarFavorite.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 12/02/2023.
//

import SwiftUI

struct StarFavorite: View {
    var body: some View {
        Circle()
            .frame(width: 70, height: 70, alignment: .trailing)
            .foregroundColor(.redJapan)
            .overlay {
                Image(systemName: "star")
                    .font(.system(size: 35))
                    .offset(y: -1)
                    .foregroundColor(.white)
            }
    }
}

struct StarFavorite_Previews: PreviewProvider {
    static var previews: some View {
        StarFavorite()
    }
}
