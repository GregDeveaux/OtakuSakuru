//
//  MangaVolumeCell.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import SwiftUI

struct MangaVolumeRow: View {
        // listen the modification in darkmode or lightmode
    @Environment(\.colorScheme) var colorScheme

    var book: Book
    var mangakas: [Mangaka] {
        book.mangakas
    }

    var body: some View {
        ZStack {
            VStack {
                /// Block
                Rectangle()
                    .frame(height: 140)
                    .foregroundColor(colorScheme == .light ? Color.white.opacity(0.55) : Color.white.opacity(0.15))
                    .cornerRadius(10)
                    .offset(y: -15)
            }

            HStack {
                /// 3D Book
                HStack(alignment: .top, spacing: 0, content: {
                    Image(book.imageName)
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
                .padding(.trailing, 40)


                VStack(alignment: .leading, spacing: 5) {
                    Text(book.publisher)
                        .padding(.bottom, 25)
                    Text(book.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Tome \(book.volume)")
                }
                .frame(width: 150, height: 180, alignment: .topLeading)
                .offset(y: -25)
//                .background(.yellow)

                Spacer()

                /// Button favorite
                StarFavorite()
                    .scaleEffect(CGSize(width: 0.6, height: 0.6), anchor: .leading)
                    .background(.blue)
            }
        }
    }
}

struct CollectionCell_Previews: PreviewProvider {
    @StateObject var viewModel = CollectionViewModel()
    
    static var previews: some View {
        MangaVolumeRow(book: <#Book#>)
    }
}


//MangaVolumeRow(imageName: "Naruto_Tome8", book: <#Book#>, title: "Naruto", volume: 8, publisher: "Hokage")
