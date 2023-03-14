//
//  ContentView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 02/02/2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {

    @ObservedObject var viewModel = AuthentificationViewModel()

    var body: some View {
        if !viewModel.validatedUser {
            AuthentificationView()
        } else {
            TabView {
                ScanView()
                    .tabItem {
                        Label("Scan", systemImage: "barcode")
                    }

                MangaDetailView()
                    .tabItem {
                        Label("Manga", systemImage: "star")
                    }

                CollectionView()
                    .tabItem {
                        Label("Collection", systemImage: "books.vertical.fill")
                    }
            }
            .accentColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        HomeView()
    }
}
