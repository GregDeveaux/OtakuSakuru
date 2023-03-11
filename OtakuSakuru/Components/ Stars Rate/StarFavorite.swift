//
//  StarFavorite.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 12/02/2023.
//

import SwiftUI

struct StarFavorite: View {
    @Binding var isFavorite: Bool
    
    @State private var isShowingStarsRateAfterLongPress: Bool = false
    @State private var numberOfStarsChoose = 0

    var body: some View {
        ZStack {
            Button {
                isFavorite.toggle()
            } label: {
                if !isFavorite {
                    DragonBall(colorOfTheBall1: .red,
                               colorOfTheBall2: Color.redJapan,
                               colorOfTheStar: .white,
                               numberOfStarsChoose: numberOfStarsChoose)
                } else {
                    ZStack {
                        OuterGlow()
                        DragonBall(colorOfTheBall1: .orange,
                                   colorOfTheBall2: .yellow,
                                   colorOfTheStar: Color.redJapan,
                                   numberOfStarsChoose: numberOfStarsChoose)
                    }
                }
            }
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 2)
                    .onEnded({ _ in
                        isShowingStarsRateAfterLongPress = true
                        isFavorite = true
                        print("✅ STAR_FAVORITE/BUTTON_LONG_GESTURE: is actived")
                    })
            )
            .overlay {
                if isShowingStarsRateAfterLongPress {
                    ChooseNumberStars(numberOfStarsChoose: $numberOfStarsChoose, isShowingStarsRateAfterLongPress: $isShowingStarsRateAfterLongPress)
                    .offset(x: 0, y: -80)
                }
            }
        }
    }
}

struct StarFavorite_Previews: PreviewProvider {
    static var previews: some View {
        StarFavorite(isFavorite: .constant(true))
    }
}

struct DragonBall: View {
    let colorOfTheBall1: Color
    let colorOfTheBall2: Color
    let colorOfTheStar: Color
    let numberOfStarsChoose: Int

    var body: some View {
        // crystal globe with stars
        Circle()
            .fill(RadialGradient(gradient: Gradient(colors: [colorOfTheBall1, colorOfTheBall2, colorOfTheBall1]), center: .center, startRadius: 50, endRadius: 10))
            .frame(width: 70, height: 70, alignment: .trailing)
            .overlay {
                ZStack {
                        /// circle bright background
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(colorOfTheBall2)
                        .blur(radius: 2)
                        .opacity(0.6)
                        .blendMode(.colorDodge)

                        /// stars
                    switch numberOfStarsChoose {
                        case 1:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 0, offsetY: 1)
                        case 2:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 10, offsetY: -10)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -10, offsetY: 10)
                        case 3:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 1, offsetY: -11)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 11, offsetY: 8)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -11, offsetY: 6)
                        case 4:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -11, offsetY: -10)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 8, offsetY: -9)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -7, offsetY: 10)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 11, offsetY: 11)
                        case 5:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 0, offsetY: -18)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -11, offsetY: -3)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 11, offsetY: -3)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -11, offsetY: 15)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 11, offsetY: 15)
                        case 6:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 0, offsetY: 0)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 0, offsetY: -18)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -18, offsetY: -3)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 18, offsetY: -3)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -11, offsetY: 16)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 11, offsetY: 16)
                        case 7:
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 0, offsetY: 0)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 2, offsetY: -20)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 17, offsetY: -10)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 17, offsetY: 11)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -17, offsetY: 10)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -2, offsetY: 20)
                            Star(colorOfTheStar: colorOfTheStar, offsetX: -17, offsetY: -11)
                        default :
                            Star(colorOfTheStar: colorOfTheStar, offsetX: 0, offsetY: -1)
                    }

                        /// bright glint #1 up left
                    Ellipse()
                        .fill(RadialGradient(gradient: Gradient(colors: [colorOfTheBall1, colorOfTheBall2, colorOfTheBall1]), center: .center, startRadius: 50, endRadius: 10))
                        .frame(width: 10, height: 15)
                        .offset(x: -25, y: -20)
                        .rotation3DEffect(.degrees(20), axis: (x: 2, y: 0.5, z: 4))
                        .blendMode(.colorDodge)

                        /// bright glint #2 up right
                    Ellipse()
                        .fill(RadialGradient(gradient: Gradient(colors: [colorOfTheBall1, colorOfTheBall2, colorOfTheBall1]), center: .center, startRadius: 50, endRadius: 10))
                        .frame(width: 20, height: 15)
                        .offset(x: 15, y: -50)
                        .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0, z: -0.5))
                        .rotationEffect(.degrees(45))
                        .blendMode(.colorDodge)

                        /// bright glint #3 left
                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .blendMode(.colorDodge)

                        /// light glint bottom
                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .rotationEffect(.degrees(-85))
                    .offset(y: 1)
                    .blur(radius: 3)
                    .blendMode(.lighten)
                    .opacity(0.80)

                        /// dark glint bottom right
                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .rotationEffect(.degrees(-105))
                    .offset(y: -3)
                    .blur(radius: 2)
                    .blendMode(.destinationOver)

                        /// dark glint bottom right
                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .rotationEffect(.degrees(-105))
                    .offset(x: 1, y: -3)
                    .opacity(0.30)
                    .blur(radius: 2)
                    .blendMode(.multiply)

                        /// dark glint bottom
                    Path() { path in
                        path.move(to: CGPoint(x: 12, y: 25))
                        path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .foregroundColor(colorOfTheBall1)
                    .rotationEffect(.degrees(-85))
                    .offset(y: 2)
                    .opacity(0.60)
                    .blur(radius: 3)
                    .blendMode(.multiply)
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
    @State var initialSizeStar: Bool = true

    let colorOfTheStar: Color
    let offsetX: CGFloat
    let offsetY: CGFloat

    var body: some View {
        Image(systemName: "star.fill")
            .font(.system(size: initialSizeStar ? 25 : 13))
            .offset(x: offsetX, y: offsetY)
            .foregroundColor(colorOfTheStar)
    }
}
