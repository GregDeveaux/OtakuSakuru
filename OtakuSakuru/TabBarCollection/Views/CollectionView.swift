//
//  CollectionView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import SwiftUI

struct CollectionView: View {
    @Environment(\.colorScheme) var colorScheme

    @StateObject var viewModel = CollectionViewModel()
    @State private var searchText = ""
    var mangas: [Manga] = []


    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding()

                    TextField("Search", text: $searchText)
                }
                .foregroundColor(colorScheme == .light ? .redJapan : .indigoJapan)
                .frame(height: 50)
                .background(.white)
                .cornerRadius(15)
                .padding()

                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 30))
                    .foregroundColor(colorScheme == . light ? .redJapan : .blueGreenJapan)
                    .frame(height: 55)
                    .padding(.trailing, 30)
            }

            Text("coucou")

            List(mangas) { manga in
                /*@START_MENU_TOKEN@*/Text(manga.title)/*@END_MENU_TOKEN@*/
                    .listRowBackground(Color.otakuBackgroundList.blendMode(.multiply))

                ForEach(manga.books, id: \.ISBN) { book in
                    MangaVolumeRow(book: book)
                }
                .listRowBackground(Color.otakuBackgroundList)
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.otakuBackgroundList)
    }

    struct CollectionListView: View {
        var body: some View {
            let mangas: [Manga] = exampleMangas

            List {
                ForEach(mangas) { manga in
                    Section(header: Text(manga.title)
                        .font(.title2)) {
                            ForEach(manga.books, id: \.ISBN) { book in
                                NavigationLink(destination: {
                                    BookDetailView()
                                }, label: {
                                    MangaVolumeRow(book: book)
                                })
                            }
                            .listRowBackground(Color.otakuBackgroundList)
                            .background(Color.otakuBackgroundList)
                            .listRowSeparator(.hidden)

                        }

                }

            }
        }
    }

    struct CollectionView_Previews: PreviewProvider {
        static var previews: some View {
            CollectionView(mangas: exampleMangas)
        }
    }
}
