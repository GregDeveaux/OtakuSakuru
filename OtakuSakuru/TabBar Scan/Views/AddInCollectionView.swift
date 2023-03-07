//
//  AddButtonInCollectionView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 19/02/2023.
//

import SwiftUI

struct AddInCollectionView: View {

    @State private var isAddToTheCollection: Bool = false

    var color: Color
    var buttonYes: Bool

    var body: some View {
        Button {
            withAnimation {
                isAddToTheCollection.toggle()
            }

            if !buttonYes {
                print("🛑 ROUNDED_RECTANGLE_BUTTON_VIEW/BUTTON: No, the manga is rejected")
            } else {
                isAddToTheCollection = true
                print("✅ ROUNDED_RECTANGLE_BUTTON_VIEW/BUTTON: the manga is added in the collection")
            }
        } label: {
            Text(buttonYes ? "YES" : "NO")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.white)
                .frame(width: 120, height: 50
                       , alignment: .center)
        }
        .background(color)
        .cornerRadius(10)
        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct RoundedRectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddInCollectionView(color: .blueGreenJapan, buttonYes: true)
    }
}
