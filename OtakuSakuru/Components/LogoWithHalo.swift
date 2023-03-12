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

                RedCircle(proxy: proxy)

                AppLogo(proxy: proxy)
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

    var proxy: GeometryProxy

    var body: some View {
        Circle()
            .frame(width: proxy.size.width / 3.2, alignment: .center)
            .offset(y: -23)
            .foregroundColor(.redJapan)
    }
}

struct AppLogo: View {

    var proxy: GeometryProxy

    var body: some View {
        Image("LogoOtakuSakuru")
            .resizable()
            .scaledToFit()
            .frame(width: proxy.size.width / 2, height: proxy.size.height / 2, alignment: .center)
    }
}
