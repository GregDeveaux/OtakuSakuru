//
//  CollectionCell.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 11/02/2023.
//

import SwiftUI

struct CollectionCell: View {
        // listen the modification in darkmode or lightmode
    @Environment(\.colorScheme) var colorScheme

    var imageName: String
    var title: String
    var volume: Int
    var publisher: String

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(publisher)
                        .multilineTextAlignment(.leading)
                    .offset(x: -25, y: -13)
                }
                    /// Block
                Rectangle()
                    .frame(height: 140)
                    .foregroundColor(colorScheme == .light ? Color.white.opacity(0.55) : Color.white.opacity(0.15))
                    .cornerRadius(10)
                    .offset(y: -15)
            }

            HStack {
                    /// Book 3D
                HStack(alignment: .top, spacing: 0, content: {
                    Image(imageName)
                        .resizable()
                        .frame(width: 80,height: 150, alignment: .leading)
                        .offset(x: 20, y: -20)
                        .rotation3DEffect(.degrees(-10),
                                          axis: (x: 0, y: 1, z: 0))
                    Image("BookPage")
                        .resizable()
                        .frame(width: 15,height: 168, alignment: .leading)
                        .offset(x: 25, y: -32)
                        .rotation3DEffect(.degrees(25),
                                          axis: (x: 0, y: 1, z: 0))
                })
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 0)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 7, y: 0)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 20, y: 0)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 50, y: 0)


                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Tome \(volume)")
                }
                .padding()

                Spacer()

                    /// Star
                StarFavorite(isActivate: false)
                    .aspectRatio(3, contentMode: .fit)
            }
        }
    }
}

struct CollectionCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCell(imageName: "Naruto_Tome8", title: "Naruto", volume: 8, publisher: "Hokage")
    }
}
