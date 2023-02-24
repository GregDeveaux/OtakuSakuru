//
//  CollectionView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 11/02/2023.
//

import SwiftUI

struct CollectionView: View {
    @StateObject var viewModel = CollectionViewModel()

    var books: [Book]

    var body: some View {
        VStack {
            HStack {
                SearchBar(searchText: .constant("One Piece")) //TODO: remove constant
                Image(systemName: "face.smiling.inverse")
                    .foregroundColor(.blueGreenJapan)
                    .padding()
            }

            NavigationView {
                List {
                    ForEach(books, id: \.title) { section in
                        Section(header: Text(section.title)) {
                            ForEach(books, id: \.ISBN) { book in
                                NavigationLink(destination: {
                                    BookDetailView()
                                }, label: {

                                })
                                MangaVolumeRow(imageName: book.imageName,
                                                title: book.title,
                                                volume: book.volume,
                                                publisher: book.publisher)
                            }
                            .listRowBackground(Color.sandJapan)
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .background(Color.sandJapan)
                        .navigationTitle("Liste")
                    }
                }
            }
        }
        .background(Color.sandJapan)
        .ignoresSafeArea()
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var exampleData = CollectionViewModel().exampleData()

    static var previews: some View {
        CollectionView(books: exampleData)
    }
}
