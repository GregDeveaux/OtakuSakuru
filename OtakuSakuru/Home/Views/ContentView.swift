//
//  ContentView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 02/02/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                    Label("Launch", systemImage: "airtag.fill")
                }

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

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
