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

    @State private var scrollSectionID: String = ""

    @State private var searchText = ""
    @State private var chosenFilter: SortFilter = .title
    
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
            ///SEARCH
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

            ///FILTER
            Menu {
                ForEach(SortFilter.allCases, id: \.self) { filter in
                    Button {
                        chosenFilter = filter
                        viewModel.sortTheBooks(by: chosenFilter)
                        print("✅ COLLECTION_VIEW/FILTER_BUTTON: You are selected \(chosenFilter)")
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
                ForEach(viewModel.arrayOfItemsForFilter, id: \.self) { itemFilter in
                    Button {
                        scrollSectionID = String(itemFilter)
                    } label: {
                        Text(itemFilter)
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .tint(colorScheme == .light ? Color.indigoJapan : Color.blueGreenJapan)
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
        ScrollViewReader { scrollView in
            List {
                    // create a section in terms of filter
                ForEach($viewModel.arrayOfItemsForFilter, id: \.self) { $section in
                    Section {
                        ForEach($viewModel.mangaBooksOfUser, id: \.ISBN) { $book in

                            if viewModel.mangaSection(chosenfilter: chosenFilter, section: book) == section {
                                NavigationLink {
                                    BookDetailView(book: $book)
                                } label: {
                                    MangaVolumeRow(book: $book)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                            //onDelete only works with ForEach
                        .onDelete(perform: { indexSet in
                            viewModel.mangaBooksOfUser.remove(atOffsets: indexSet)
                        })
                    } header: {
                        VStack {
                            Text(section)
                                .font(.smallCaps(.title2)())
                                .bold()
                                .frame(height: 10)
                                .padding(.bottom, 5)
                            Capsule()
                                .frame(height: 1)
                                .opacity(0.3)
                        }
                    }
                    .listRowBackground(Color.otakuBackgroundSecondary)
                    .listRowSeparator(.hidden)
                    .id(section)
                }
                .onChange(of: scrollSectionID) { newValue in
                    withAnimation(.spring()) {
                        scrollView.scrollTo(newValue, anchor: .top)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.otakuBackgroundSecondary)
            .onAppear {
                viewModel.sortTheBooks(by: chosenFilter)
            }
        }
    }
}


struct CollectionView_Previews: PreviewProvider {

    static var previews: some View {
        CollectionView()
    }
}



