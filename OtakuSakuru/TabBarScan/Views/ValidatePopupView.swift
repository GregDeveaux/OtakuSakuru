//
//  ValidatePopupView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 18/02/2023.
//

import SwiftUI

struct ValidatePopupView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                .opacity(0.8)
            Image("OnePiece-Novel")
                .frame(width: 200, height: 200, alignment: .center)
//                .blur(radius: 20)

            VStack {
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: proxy.size.width * 0.8, height: proxy.size.height * 0.7, alignment: .center)
                        .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                        .opacity(0.5)
                        .background(.ultraThinMaterial)
                        .overlay {
                            VStack {
                                Text("Yippee!")
                                    .bold()
                                    .font(.system(size: 30))
                                    .fontDesign(.rounded)
                                Text("You don't have this manga\n in your collection")
                                    .font(.subheadline)

                                Image("OnePiece-Novel")
                                    .resizable()
                                    .scaledToFill()
                                .frame(width: proxy.size.width * 0.45, height: proxy.size.height * 0.3, alignment: .center)
                                Button {

                                } label: {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(.redJapan)
                                        .frame(width: proxy.size.width * 0.25, height: proxy.size.height * 0.07, alignment: .leading)
                                        Spacer()
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(.blueGreenJapan)
                                        .frame(width: proxy.size.width * 0.25, height: proxy.size.height * 0.07, alignment: .leading)
                                    }
                                }

                            }
                        }
                }
            }
        }
    }
}

struct ValidatePopupView_Previews: PreviewProvider {
    static var previews: some View {
        ValidatePopupView()
    }
}
