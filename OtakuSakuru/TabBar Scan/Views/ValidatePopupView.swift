//
//  ValidatePopupView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 18/02/2023.
//

import SwiftUI

struct ValidatePopupView: View {
    @Environment (\.colorScheme) var colorSheme

    var title: String
    var isbn: String
        // found code key of the url to retrieve the image
    var numberKeyToRecieveImage: Int {
        var number = 00
        if !isbn.isEmpty {
            let stringIsbnArray = isbn.split(separator: "")
            number = Int(stringIsbnArray[10] + stringIsbnArray[11]) ?? 00
        }
        return number
    }

    var body: some View {
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
                                .foregroundColor(colorSheme == .light ? Color.blueGreenJapan : Color.darkIndigoJapan)

                            Text("You don't have this manga\n in your collection")
                                .font(.system(size: 17))
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding(.top, 1)
                                .offset(y: -10)

                            AsyncImage(url: URL(string: "https://www.canalbd.net/img/couvpage/\(numberKeyToRecieveImage)/\(isbn)_cg.jpg")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.33, alignment: .center)
                                    .background(Color.indigoJapan)
                            }
                            .scaledToFit()
                            .frame(width: proxy.size.width * 0.5,
                                   height: proxy.size.height * 0.33,
                                   alignment: .center)
                            .padding(.bottom, 25)
                            .overlay(alignment: .bottom) {
                                Text(isbn)
                                    .font(.system(size: 15))
                                    .frame(width: 150, height: 30, alignment: .center)
                                    .background(.regularMaterial)
                                    .cornerRadius(30)
                                    .padding(.bottom, 40)
                            }

                            Text("Do you want to add\n \(Text("\(title)").bold().foregroundColor(colorSheme == .light ? Color.blueGreenJapan : Color.darkIndigoJapan))  \nin the collection?")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)

                            HStack {
                                AddInCollectionView(
                                    color: .redJapan,
                                    buttonYes: false)
                                AddInCollectionView(
                                    color: .blueGreenJapan,
                                    buttonYes: true)
                            }
                        }
                    }
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct ValidatePopupView_Previews: PreviewProvider {
    static var previews: some View {
        ValidatePopupView(title: "Gunnm - Edition originale", isbn: "9782344017548")
    }
}
