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
    @State var mangas: [Manga] = []
    @State private var sortfilter: SortFilter = .title

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    searchBar
                    scrollAnchorButtonOfItem
                }
                .offset(y: -13)
                .background(Color.otakuBackgroundPrimary)
                
                collectionList
                    .navigationTitle("Collection")
                    .navigationBarTitleDisplayMode(.inline)
                    .scrollContentBackground(.hidden)
            }
        }
    }

        // ---------------------------------------------------------------
        // MARK: - searchbar + filter
        // ---------------------------------------------------------------

    var searchBar: some View {
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

            Menu {
                ForEach(SortFilter.allCases, id: \.self) { filter in
                    Button {
                        print("✅ COLLECTION_VIEW/FILTER_BUTTON: You are selected")
                    } label: {
                        Text(filter.rawValue)
                    }
                }
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 30))
                    .foregroundColor(colorScheme == . light ? .sandJapan : .blueGreenJapan)
                    .frame(height: 55)
                    .padding(.trailing, 30)
            }
        }
    }

        // ---------------------------------------------------------------
        // MARK: - button with anchor on the list
        // ---------------------------------------------------------------

    var scrollAnchorButtonOfItem: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 15) {
                ForEach(mangas) { manga in
                    ForEach(manga.books) { book in
                        Button {

                        } label: {
                            Text(manga.title)
                                .font(.system(size: 15))
                                .bold()
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(10)
                        .tint(colorScheme == .light ? Color.indigoJapan : Color.blueGreenJapan)
                    }
                }
            }
        })
        .padding(.leading, 15)
        .padding(.bottom, 5)
    }


        // ---------------------------------------------------------------
        // MARK: - list with section
        // ---------------------------------------------------------------

    var collectionList: some View {
            List(mangas) { manga in
                if var books = manga.books {
                    Section {
                        ForEach(books, id: \.ISBN) { book in
                            NavigationLink {
                                BookDetailView(book: book)
                            } label: {
                                MangaVolumeRow(book: book)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .onDelete(perform: { indexSet in
                            books.remove(atOffsets: indexSet)
                        })
                        .listRowBackground(Color.otakuBackgroundSecondary)
                        .listRowSeparator(.hidden)
                    } header: {
                        VStack {
                            Text(manga.title)
                                .font(.smallCaps(.title2)())
                                .bold()
                            .frame(height: 10)
                            .padding(.bottom, 5)
                            Capsule()
                                .frame(height: 1)
                                .opacity(0.3)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.otakuBackgroundSecondary)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var mangas: [Manga] = exampleMangas

    static var previews: some View {
        CollectionView(mangas: mangas)
    }
}
