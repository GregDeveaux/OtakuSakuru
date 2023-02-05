//
//  ContentView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 02/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            LaunchView()
                .tabItem {
                    Label("Launch", systemImage: "airtag.fill")
                }

            MangaDetailView()
                .tabItem {
                    Label("Manga", systemImage: "star")
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
