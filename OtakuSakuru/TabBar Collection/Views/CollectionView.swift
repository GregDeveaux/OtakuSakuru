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
    @State private var searchResult = CollectionViewModel().mangaBooksCollection   //TODO: var à revoir

    @State private var searchText: String = ""
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
        VStack {
            Text(searchText)
            HStack {
                ///SEARCH
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing, 3)
                        .padding(.leading, 16)

                    TextField("Recherche", text: $searchText)
                        .overlay(alignment: .trailing) {
                            if !searchText.isEmpty {
                                Button {
                                    self.searchText = ""
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .padding()
                                }
                            }
                        }
                }
                .foregroundColor(colorScheme == .light ? .redJapan : .indigoJapan)
                .frame(height: 45)
                .background(.white)
                .cornerRadius(15)
                .padding()

                ///FILTER
                Menu {
                    ForEach(SortFilter.allCases) { filter in
                        Button {
                            chosenFilter = filter
                            viewModel.setUpList(by: chosenFilter)
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
    }

        // ---------------------------------------------------------------
        // MARK: - button with anchor on the list
        // ---------------------------------------------------------------

    var scrollAnchorButtonOfItem: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 15) {
                ForEach(viewModel.titlesButtonBySortFilter, id: \.self) { itemFilter in
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
                // create a list of the all manga
            List {
                ForEach($viewModel.titlesSectionBySortFilter, id: \.self) { $section in
                        // create a section in terms of filter
                    Section {
                            // Books sorted by section title
                        ForEach($searchResult, id: \.ISBN) { $book in

                            if viewModel.giveBookValueToStoreUnderEachSection(chosenfilter: chosenFilter, book: book, section: section) {

                                NavigationLink {
                                        // use $ only to modify property
                                    BookDetailView(book: book, isFavorite: $book.isFavorite)
                                } label: {
                                    MangaVolumeRow(book: book, isFavorite: $book.isFavorite)
                                        .padding(.trailing, -20)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                            //onDelete only works with ForEach
                        .onDelete(perform: { indexSet in
                            viewModel.deleteRow(indexSet: indexSet)
                            searchResult = viewModel.mangaBooksCollection
                            if section.isEmpty {
                                guard let index = viewModel.titlesSectionBySortFilter.firstIndex(of: section) else { return }
                                viewModel.titlesSectionBySortFilter.remove(at: index)
                            }
                        })
                            // searchBar action
                        .onChange(of: searchText) { searchText in
                                // modify collection according to searchText
                            if searchText.isEmpty || searchText != searchText {
                                searchResult = viewModel.mangaBooksCollection
                            } else {
                                searchResult = viewModel.mangaBooksCollection.filter({ book in
                                    book.title.lowercased().contains(searchText.lowercased())
                                })
                            }
                        }
                    } header: {
                        VStack(alignment: .center) {
                            Text(section)
                                .font(.smallCaps(.title2)())
                                .bold()
                                .frame(height: 10)
                                .padding(.bottom, 5)
                            Capsule()
                                .frame(height: 0.7)
                                .opacity(0.3)
                                .padding(.leading, -35)
                                .padding(.trailing, -35)
                        }
                    }
                    .listRowBackground(Color.otakuBackgroundSecondary)
                    .listRowSeparator(.hidden)
                        // create id section for automatic scroll
                    .id(section)
                }
                    //go to the section by automatic scroll
                .onChange(of: scrollSectionID) { sectionID in
                    withAnimation(.spring()) {
                        scrollView.scrollTo(sectionID, anchor: .top)
                    }
                }
            }
            .listStyle(PlainListStyle()) // without section menu
            .background(Color.otakuBackgroundSecondary)
                // as soon as the view is show update list
            .onAppear {
                viewModel.setUpList(by: chosenFilter)
            }
                // use the refresh by scroll
            .refreshable {
                viewModel.setUpList(by: chosenFilter)
            }
                // message text if list is empty
            .overlay {
                if viewModel.mangaBooksCollection.isEmpty {
                    Text("Ta collection est vide,\nscanne un code barre pour ajouter\nautomatiquement un titre")
                        .bold()
                        .multilineTextAlignment(.center)
                }
            }
        }

    }
}


struct CollectionView_Previews: PreviewProvider {

    static var previews: some View {
        CollectionView()
    }
}



