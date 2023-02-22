//
//  SearchBar.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 22/02/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.redJapan)
                .padding()

            TextField("Search", text: $searchText)
                .foregroundColor(.redJapan)
        }
        .frame(height: 50)
        .background(.white)
        .cornerRadius(15)
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("One Piece"))
    }
}
