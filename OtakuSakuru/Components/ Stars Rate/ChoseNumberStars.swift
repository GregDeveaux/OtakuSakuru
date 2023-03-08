//
//  ChoseNumberStars.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 07/03/2023.
//

import SwiftUI

struct ChooseNumberStars: View {

    @State private var numberOfStarsChoose = 1
    @State var isActived: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            Text("Choisis le nombre d'étoiles")
                .foregroundColor(.darkIndigoJapan)
            HStack {
                ForEach(1...7, id: \.self) { index in
                    if index <= numberOfStarsChoose {
                        StarForRate(index: index, isActived: true, numberOfStarsChoose: $numberOfStarsChoose)
                    } else {
                        StarForRate(index: index, isActived: false, numberOfStarsChoose: $numberOfStarsChoose)
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
        ChooseNumberStars()
    }
}

struct StarForRate: View {
    @Environment(\.colorScheme) var colorScheme

    var index: Int
    var isActived: Bool
    @Binding var numberOfStarsChoose: Int


    var body: some View {
        Button {
            numberOfStarsChoose = index
        } label: {
            Image(systemName: isActived ? "star.fill" : "star")
                .foregroundColor(colorScheme == .light ? .redJapan : .blueGreenJapan)
        }
    }
}
