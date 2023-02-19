//
//  ValidatePopupView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 18/02/2023.
//

import SwiftUI

struct ValidatePopupView: View {
    @State var url = URL(string: "")
    @State var title = "Manga"

    var body: some View {
        ZStack {
//            Color.black.ignoresSafeArea()
//                .opacity(0.8)
            VStack {
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .frame(width: proxy.size.width * 0.8,
                               height: proxy.size.height * 0.7,
                               alignment: .center)
                        .position(x: proxy.size.width / 2,
                                  y: proxy.size.height / 2)
                        .opacity(0.5)
                        .background(.ultraThinMaterial)
                        .overlay {
                            VStack {
                                Text("Yippee!")
                                    .fontWeight(.heavy)
                                    .bold()
                                    .font(.system(size: 30))
                                    .fontDesign(.rounded)
                                    .foregroundColor(.blueGreenJapan)
                                Text("You don't have this manga\n in your collection")
                                    .font(.system(size: 17))
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 1)
                                    .offset(y: -10)

                                AsyncImage(url: url) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .scaledToFit()
                                .frame(width: proxy.size.width * 0.5,
                                       height: proxy.size.height * 0.33,
                                       alignment: .center)
                                .padding(.bottom, 25)
                                .background(Color.blueGreenJapan)
                                .overlay(alignment: .bottom) {
                                        Text("ISBN")
                                        .font(.system(size: 15))
                                            .frame(width: 150, height: 30, alignment: .center)
                                            .background(.regularMaterial)
                                            .cornerRadius(30)
                                            .padding()
                                }

                                Text("Do you want to add\n \(Text("\(title)").bold().foregroundColor(.blueGreenJapan))  \nin the collection?")
                                    .font(.system(size: 17))
                                    .multilineTextAlignment(.center)

                                HStack {
                                    RoundedRectangleButtonView(
                                        color: .redJapan,
                                        buttonYes: false)
                                    RoundedRectangleButtonView(
                                        color: .blueGreenJapan,
                                        buttonYes: true)
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
