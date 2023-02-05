//
//  ContentView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 02/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.redJapan.ignoresSafeArea()

            Image("LogoOtakuSakuru")
                .resizable()
                .scaledToFit()
                .frame(width: 280, height: 280, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
