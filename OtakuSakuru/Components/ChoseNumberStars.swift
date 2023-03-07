//
//  ChoseNumberStars.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 07/03/2023.
//

import SwiftUI

struct ChooseNumberStars: View {

    @State private var totalRate = 5
    @State var isActived: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            Text("Choisis le nombre d'étoiles")
                .foregroundColor(.darkIndigoJapan)
            HStack {
                ForEach(1...7, id: \.self) { index in
                    if index <= totalRate {
                        StarForRate(isActived: true , index: index)
                    } else {
                        StarForRate(isActived: false , index: index)
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
    @State var isActived: Bool = false
    var index: Int

    var body: some View {
        Button {
            isActived.toggle()
        } label: {
            Image(systemName: isActived ? "star.fill" : "star")
                .foregroundColor(.redJapan)
        }
    }
}
