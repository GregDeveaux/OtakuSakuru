//
//  StarFavorite.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 12/02/2023.
//

import SwiftUI

struct StarFavorite: View {
    @Binding var isFavorite: Bool

    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            if !isFavorite {
                DragonBall(colorOfTheBall1: .red,
                           colorOfTheBall2: Color.redJapan,
                           colorOfTheStar: .white)
            } else {
                ZStack {
                    if isFavorite {
                        OuterGlow()
                    }
                    DragonBall(colorOfTheBall1: .orange,
                               colorOfTheBall2: .yellow,
                               colorOfTheStar: Color.redJapan)
                }
            }
        }
        .simultaneousGesture(
        LongPressGesture(minimumDuration: 2)
            .onEnded({ _ in
                print("✅ STAR_FAVORITE/BUTTON_LONG_GESTURE: is actived")
            })
        )
    }
}

struct StarFavorite_Previews: PreviewProvider {
    static var previews: some View {
        StarFavorite(isFavorite: .constant(false))
    }
}

struct DragonBall: View {
    let colorOfTheBall1: Color
    let colorOfTheBall2: Color
    let colorOfTheStar: Color

    var body: some View {
        Circle()
            .fill(RadialGradient(gradient: Gradient(colors: [colorOfTheBall1, colorOfTheBall2, colorOfTheBall1]), center: .center, startRadius: 50, endRadius: 10))
            .frame(width: 70, height: 70, alignment: .trailing)
            .overlay {
                ZStack {
                    Star(colorOfTheStar: colorOfTheStar, offset: -1)
                    Ellipse()
                        .fill(RadialGradient(gradient: Gradient(colors: [colorOfTheBall1, colorOfTheBall2, colorOfTheBall1]), center: .center, startRadius: 50, endRadius: 10))
                        .frame(width: 10, height: 15)
                        .offset(x: -25, y: -20)
                        .rotation3DEffect(.degrees(20), axis: (x: 2, y: 0.5, z: 4))
                        .blendMode(.colorDodge)

                    Ellipse()
                        .fill(RadialGradient(gradient: Gradient(colors: [colorOfTheBall1, colorOfTheBall2, colorOfTheBall1]), center: .center, startRadius: 50, endRadius: 10))
                        .frame(width: 20, height: 15)
                        .offset(x: 15, y: -50)
                        .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0, z: -0.5))
                        .rotationEffect(.degrees(45))
                        .blendMode(.colorDodge)

                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .rotationEffect(.degrees(-85))
                    .offset(y: 1)
                    .opacity(0.65)
                    .blur(radius: 3)

                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .rotationEffect(.degrees(-105))
                    .offset(y: -3)
                    .opacity(0.45)
                    .blur(radius: 2)

                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .blendMode(.colorDodge)
                }
            }
    }
}

struct OuterGlow: View {
    var body: some View {
        Circle()
            .fill(RadialGradient(gradient: Gradient(colors: [.orange, .yellow, .orange]), center: .center, startRadius: 50, endRadius: 10))
            .frame(width: 70, height: 70, alignment: .trailing)
            .blur(radius: 7)
            .opacity(0.45)
    }
}

struct Star: View {
    let colorOfTheStar: Color
    let offset: CGFloat

    var body: some View {
        Image(systemName: "star.fill")
            .font(.system(size: 25))
            .offset(y: offset)
            .foregroundColor(colorOfTheStar)
            .overlay {
                Image(systemName: "star.fill")
                    .font(.system(size: 20))
                    .offset(y: offset * 0.66)
                    .foregroundColor(.red)
            }
    }
}
