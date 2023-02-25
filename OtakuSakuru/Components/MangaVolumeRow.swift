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
            .offset(y: -5)


            VStack(alignment: .leading, spacing: 7) {

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(book.title)
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)

                        Text("Tome \(book.volume)")
                            .bold()
                            .font(.system(size: 14))
                            .accessibilityLabel("numéro de tome")
                    }

                    Spacer()

                    StarFavorite()
                        .scaleEffect(CGSize(width: 0.5, height: 0.5), anchor: .center)
                        .frame(width: 45, height: 45, alignment: .center)
                }

                Spacer()

                Label(book.readStatus.rawValue, systemImage: "book")
                    .font(.system(size: 13))
                    .bold()
                    .fontWidth(.condensed)
                    .foregroundColor(.white)
                    .padding(5)
                    .padding(.leading, 7)
                    .padding(.trailing, 7)
                    .background(
                    Capsule()
                        .foregroundColor(colorScheme == .light ? Color.redJapan : Color.blueGreenJapan)
                )
            }
            .offset(y: -15)

            Spacer()
        }
        .frame(height: 110, alignment: .center)
        .background(
            /// Block
            Rectangle()
                .frame(height: 140)
                .foregroundColor(colorScheme == .light ? Color.white.opacity(0.55) : Color.white.opacity(0.15))
                .cornerRadius(10)
                .offset(y: -10)
        )
        .padding(.top, 55)
        .padding(.bottom, 10)
    }
}

struct CollectionCell_Previews: PreviewProvider {

    static let viewModel = CollectionViewModel()
    static let books = exampleBooks

    static var previews: some View {
        ZStack {
            /// Background
            Color.otakuBackgroundList.ignoresSafeArea()
            /// Preview
            MangaVolumeRow(book: books[0])
        }
    }
}
