//
//  ChoseNumberStars.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 07/03/2023.
//

import SwiftUI

struct ChooseNumberStars: View {

    @Binding var numberOfStarsChoose: Int
    @Binding var isChoose: Bool

    @State var isActived: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            Text("Choisis le nombre d'étoiles")
                .foregroundColor(.darkIndigoJapan)
                .bold()
            
            HStack {
                ForEach(1...7, id: \.self) { index in
                    if index <= numberOfStarsChoose {
                        StarForRate(numberOfStarsChoose: $numberOfStarsChoose,
                                    isChoose: $isChoose,
                                    index: index,
                                    isActived: true)
                    } else {
                        StarForRate(numberOfStarsChoose: $numberOfStarsChoose,
                                    isChoose: $isChoose,
                                    index: index,
                                    isActived: false)
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .opacity(0.5)
                .frame(width: 250, height: 80, alignment: .center)
        )

    }
}

struct ChoseNumberStars_Previews: PreviewProvider {
    static var previews: some View {
        ChooseNumberStars(numberOfStarsChoose: .constant(5),
                          isChoose: .constant(false))
    }
}

    //create star button with index
struct StarForRate: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var numberOfStarsChoose: Int
    @Binding var isChoose: Bool

    var index: Int
    var isActived: Bool

    var body: some View {
        Button {
            numberOfStarsChoose = index
            isChoose.toggle()
        } label: {
            Image(systemName: isActived ? "star.fill" : "star")
                .foregroundColor(colorScheme == .light ? .redJapan : .blueGreenJapan)
        }
    }
}
