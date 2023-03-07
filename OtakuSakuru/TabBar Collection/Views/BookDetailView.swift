//
//  BookDetailView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 23/02/2023.
//

import SwiftUI

struct BookDetailView: View {
    @State var book: Book
    @Binding var isFavorite: Bool

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.otakuBackgroundSecondary
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .center, spacing: 15) {

                        Text("lecture : \(Text(book.readStatus.rawValue).bold())")

                        HStack(spacing: 50) {
                            ForEach(book.kinds) { kind in
                                Text(kind.rawValue).bold()
                            }
                        }

                        Image(book.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width * 0.65,
                                   height: proxy.size.height * 0.65,
                                   alignment: .center)
                            .padding()
                            .padding(.top, 40)
                            .overlay(alignment: .bottom) {
                                StarFavorite(isFavorite: $isFavorite)
                                    .offset(y: 30)
                            }

                        VStack(alignment: .center, spacing: 15) {
                            HStack {
                                Text(book.title)
                                    .font(.title).bold()
                                    .fontDesign(.rounded)

                                Text("• Tome \(book.volume)")
                                    .font(.title).bold()
                                    .fontDesign(.rounded)
                            }

                            Text(book.category.rawValue)

                            Text("Éditeur : \(Text(book.publisher).bold())")

                            Text("Nbre de pages : \(Text(String(book.numberOfPages)).bold())")

                            Text("Dimensions : \(Text(book.dimensions).bold())")

                            Text("Date de publication : \(Text(book.releaseDate).bold())")

                            Text("ISBN : \(Text(String(book.ISBN)).bold())")

                            ForEach(book.mangakas) { mangaka in
                                Text("mangakas : \(Text(mangaka.name).bold())")
                            }

                            VStack(alignment: .leading, spacing: 15) {
                                Text("Synopsis")
                                    .font(.title2)
                                Capsule()
                                    .frame(height: 1)
                                Text(book.synopsis)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var book = Book.example

    static var previews: some View {
        BookDetailView(book: book[5], isFavorite: .constant(true))
    }
}
