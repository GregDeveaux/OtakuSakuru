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
        GeometryReader { proxy in
            ZStack {
                Halo(proxy: proxy)

                RedCircle()

                AppLogo()
            }
        }
    }
}

struct LogoWithHalo_Previews: PreviewProvider {
    static var previews: some View {
        LogoWithHalo()
    }
}

struct Halo: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var angle: Double = 360
    
    var proxy: GeometryProxy

    var body: some View {
        Image("Halo")
            .ignoresSafeArea()
            .blendMode(.softLight)
            .opacity(colorScheme == .light ? 0.85 : 0.25)
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
            .offset(y: -20)
            .rotationEffect(Angle(degrees: angle))
            .onAppear {
                withAnimation(.linear(duration: 90).repeatForever()) {
                    angle = 0
                }
            }
    }
}

    // Red circle under the circle of logo
struct RedCircle: View {
    var body: some View {
        Circle()
            .frame(width: 129, height: 129, alignment: .center)
            .offset(y: -23)
            .foregroundColor(.redJapan)
    }
}

struct AppLogo: View {
    var body: some View {
        Image("LogoOtakuSakuru")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
    }
}
