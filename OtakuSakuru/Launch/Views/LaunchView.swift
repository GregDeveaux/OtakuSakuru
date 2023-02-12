//
//  LaunchAnimateView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/02/2023.
//

import SwiftUI

struct LaunchAnimateView: View {
    var body: some View {
        ZStack {
            // use lightmode or darkmode Background on the all screen
            Color.otakuBackground.ignoresSafeArea()

            LogoWithHalo()

        }
        /// description for accessibility
        .accessibilityLabel("Welcome to the Otaku Sakuru App, the app of the community of manga fans")
    }
}

struct LaunchAnimateView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAnimateView()
    }
}
