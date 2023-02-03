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
            Color.red.ignoresSafeArea()
            VStack {
                Image("LogoOtakuSakuru")
            }
            .padding(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
