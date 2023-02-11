//
//  CollectionCell.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 11/02/2023.
//

import SwiftUI

struct CollectionCell: View {
    var imageName: String
    var title: String
    var volume: Int
    var publisher: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150, alignment: .center)
                .padding()

            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.black)
                Text("Tome \(volume)")
                Text(publisher)
            }
            .padding()

            Spacer()
            
        }
        .frame(height: 180)
        .background(Color.otakuBackground)
        .cornerRadius(15)
    }
}

struct CollectionCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCell(imageName: "Naruto_Tome8", title: "Naruto", volume: 8, publisher: "Hokage")
    }
}
