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
        // found code key of the url to retrieve the image in website
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
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 300,
                       height: 540,
                       alignment: .center)
                .opacity(0.5)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .overlay {
                    VStack {
                        Text("Subarashī!")
                            .fontWeight(.heavy)
                            .bold()
                            .font(.system(size: 30))
                            .fontDesign(.rounded)
                            .foregroundColor(colorSheme == .light ? Color.blueGreenJapan : Color.darkIndigoJapan)

                        Text("Tu n'as pas ce manga\n dans ta collection")
                            .font(.system(size: 17))
                            .bold()
                            .multilineTextAlignment(.center)

                        AsyncImage(url: URL(string: "https://www.canalbd.net/img/couvpage/\(numberKeyToRecieveImage)/\(isbn)_cg.jpg")) { image in
                            image.resizable()
                        } placeholder: {
                                // substitution image with progress indicator
                            ProgressView()
                                .frame(width: 195, height: 270, alignment: .center)
                                .background(Color.indigoJapan)
                        }
                        .scaledToFit()
                        .frame(width: 195, height: 270, alignment: .center)
                        .overlay(alignment: .bottom) {
                            Text(isbn)
                                .font(.system(size: 12))
                                .frame(width: 120, height: 20, alignment: .center)
                                .background(.regularMaterial)
                                .cornerRadius(30)
                                .padding(.bottom, 20)
                        }

                        Text("Est-ce que tu veux ajouter\n \(Text("\(title)").bold().foregroundColor(colorSheme == .light ? Color.blueGreenJapan : Color.darkIndigoJapan))  \nà ta collection ?")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                            .padding(.bottom, 0)

                        HStack {
                            ButtonOfValidation(
                                isButtonYes: false)
                            ButtonOfValidation(
                                isButtonYes: true)
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
