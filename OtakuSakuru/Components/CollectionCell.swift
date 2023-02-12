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

                Rectangle()
                    .frame(height: 140)
                    .foregroundColor(colorScheme == .light ? Color.white.opacity(0.55) : Color.white.opacity(0.15))
                    .cornerRadius(10)
                    .offset(y: -15)
            }


            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150, alignment: .center)
                    .offset(x: 0, y: -20)
                    .padding()

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Tome \(volume)")
                }
                .padding()

                Spacer()

                StarFavorite()
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
