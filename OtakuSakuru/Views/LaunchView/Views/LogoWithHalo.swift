//
//  LogoWithHalo.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 08/02/2023.
//

import SwiftUI

struct LogoWithHalo: View {

        // listen the modification in darkmode or lightmode
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        /// Halo
        Image("Halo")
            .ignoresSafeArea()
            .blendMode(.softLight)
            .opacity(colorScheme == .light ? 0.85 : 0.25)
            .frame(width: 1175, height: 1175, alignment: .center)
            .offset(y: -20)

        /// Red circle under the circle of logo
        Circle()
            .position(x: 65, y: 44.3)
            .frame(width: 130, height: 130, alignment: .center)
            .foregroundColor(.redJapan)

        /// Logo
        Image("LogoOtakuSakuru")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct LogoWithHalo_Previews: PreviewProvider {
    static var previews: some View {
        LogoWithHalo()
    }
}
