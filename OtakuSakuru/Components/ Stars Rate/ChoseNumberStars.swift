//
//  ChoseNumberStars.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 07/03/2023.
//

import SwiftUI

struct ChooseNumberStars: View {

    @Binding var numberOfStarsChoose: Int
    @Binding var isShowingStarsRateAfterLongPress: Bool

    @State var isActived: Bool = false

    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .opacity(0.5)
            .background(.ultraThinMaterial)
            .frame(width: 280, height: 70, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack(spacing: 5) {
                    Text("Choisis le nombre d'étoiles")
                        .foregroundColor(.darkIndigoJapan)
                        .font(.system(size: 17))
                        .bold()
                    
                    HStack {
                        ForEach(1...7, id: \.self) { index in
                            if index <= numberOfStarsChoose {
                                StarForRate(numberOfStarsChoose: $numberOfStarsChoose,
                                            isShowingStarsRateAfterLongPress: $isShowingStarsRateAfterLongPress,
                                            index: index,
                                            isActived: true)
                            } else {
                                StarForRate(numberOfStarsChoose: $numberOfStarsChoose,
                                            isShowingStarsRateAfterLongPress: $isShowingStarsRateAfterLongPress,
                                            index: index,
                                            isActived: false)
                            }
                        }
                    }
                }
            }
    }
}

struct ChoseNumberStars_Previews: PreviewProvider {
    static var previews: some View {
        ChooseNumberStars(numberOfStarsChoose: .constant(5),
                          isShowingStarsRateAfterLongPress: .constant(true))
    }
}

    //create star button with index
struct StarForRate: View {
    @Environment (\.dismiss) var dismiss

    @Binding var numberOfStarsChoose: Int
    @Binding var isShowingStarsRateAfterLongPress: Bool

    var index: Int
    var isActived: Bool

    var body: some View {
        Button {
            numberOfStarsChoose = index
            print("✅ STAR_FOR_RATE/STAR_BUTTON: number of stars choose = \(numberOfStarsChoose)")
            isShowingStarsRateAfterLongPress = false
        } label: {
            Image(systemName: isActived ? "star.fill" : "star")
                .resizable()
                .scaledToFit()
                .foregroundColor(.redJapan)
                .frame(width: 25, height: 22, alignment: .center)
                .padding(2)
        }
    }
}
