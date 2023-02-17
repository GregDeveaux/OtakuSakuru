//
//  StarFavorite.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 12/02/2023.
//

import SwiftUI

struct StarFavorite: View {
    @State var isActivate: Bool

    var body: some View {
        Button {
            withAnimation(.easeIn(duration: 0.5)) {
                isActivate.toggle()
            }
        } label: {
            if !isActivate {
                Circle()
                    .frame(width: 70, height: 70, alignment: .trailing)
                    .foregroundColor(.redJapan)
                    .overlay {
                        ZStack {
                            Image(systemName: "star")
                                .font(.system(size: 35))
                                .fontWeight(.light)
                                .offset(y: -1)
                            .foregroundColor(.white)
                        }
                    }
            } else {
                ZStack {
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.orange, .yellow, .orange]), center: .center, startRadius: 50, endRadius: 10))
                        .frame(width: 70, height: 70, alignment: .trailing)
                        .blur(radius: 7)
                        .opacity(0.45)
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.orange, .yellow, .orange]), center: .center, startRadius: 50, endRadius: 10))
                        .frame(width: 70, height: 70, alignment: .trailing)
                        .overlay {
                            ZStack {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 25))
                                    .offset(y: -1)
                                    .foregroundColor(.redJapan)
                                    .overlay {
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 20))
                                            .offset(y: -1)
                                            .foregroundColor(.red)
                                }
                                Ellipse()
                                    .fill(RadialGradient(gradient: Gradient(colors: [.orange, .yellow, .orange]), center: .center, startRadius: 50, endRadius: 10))
                                    .frame(width: 10, height: 15)
                                    .offset(x: -25, y: -20)
                                    .rotation3DEffect(.degrees(20), axis: (x: 2, y: 0.5, z: 4))
                                    .blendMode(.colorDodge)

                                Ellipse()
                                    .fill(RadialGradient(gradient: Gradient(colors: [.orange, .yellow, .orange]), center: .center, startRadius: 50, endRadius: 10))
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
                                .foregroundColor(.orange)
                                .rotationEffect(.degrees(-85))
                                .offset(y: 1)
                                .opacity(0.65)
                                .blur(radius: 3)

                                Path() { path in
                                    path.move(to: CGPoint(x: 12, y: 25))
                                    path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                                }
                                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                                .foregroundColor(.orange)
                                .rotationEffect(.degrees(-105))
                                .offset(y: -3)
                                .opacity(0.45)
                                .blur(radius: 2)

                                Path() { path in
                                    path.move(to: CGPoint(x: 12, y: 25))
                                    path.addCurve(to: CGPoint(x: 15, y: 52), control1: CGPoint(x: 10, y: 28), control2: CGPoint(x: 7, y: 40))
                                }
                                .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round))
                                .foregroundColor(.orange)
                                .blendMode(.colorDodge)
                            }
                    }
                }
                .animation(.easeInOut, value: 5)
            }
        }
    }
}

struct StarFavorite_Previews: PreviewProvider {
    static var previews: some View {
        StarFavorite(isActivate: false)
    }
}
