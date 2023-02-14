//
//  ScanView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 07/02/2023.
//

import SwiftUI

struct ScanView: View {
    @StateObject private var model = ScanViewModel()

    var body: some View {

        ZStack {
            Color.redJapan
                .ignoresSafeArea()
            LogoWithHalo()
                .offset(y: -265)
            VStack {
                FrameScanView(image: model.frame, isbnText: model.isbnText ?? "nil")

                Button {

                } label: {
                    Circle()
                        .frame(width: 90, height: 90, alignment: .center)
                        .foregroundColor(Color.indigoJapan)
                        .overlay {
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.white)
                                .frame(width: 35, height: 35, alignment: .center)
                        }
                }
            }

        }

    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
