//
//  AddButtonInCollectionView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 19/02/2023.
//

import SwiftUI

struct ButtonOfValidation: View {

    @StateObject var viewModel = CollectionViewModel()

    @State private var isAddToTheCollection: Bool = false

    var isButtonYes: Bool

    var body: some View {
        Button {
            withAnimation {
                isAddToTheCollection.toggle()
            }

            if !isButtonYes {
                print("🛑 ROUNDED_RECTANGLE_BUTTON_VIEW/BUTTON: No, the manga is rejected")
            } else {
                isAddToTheCollection = true
                print("✅ ROUNDED_RECTANGLE_BUTTON_VIEW/BUTTON: the manga is added in the collection")
            }
        } label: {
            Text(isButtonYes ? "YES" : "NO")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.white)
                .frame(width: 120, height: 50
                       , alignment: .center)
        }
        .background(isButtonYes ? Color.blueGreenJapan : Color.redJapan)
        .cornerRadius(10)
        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct ButtonOfValidation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonOfValidation(isButtonYes: true)
    }
}
