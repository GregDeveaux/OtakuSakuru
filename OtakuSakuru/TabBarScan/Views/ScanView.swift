//
//  ScanView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 07/02/2023.
//

import SwiftUI

struct ScanView: View {
    @StateObject private var scanViewModel = ScanViewModel()
    @State private var isActivated = false

    var body: some View {

        ZStack {
            Color.redJapan
                .ignoresSafeArea()
            LogoWithHalo()
                .offset(y: -265)
            VStack {
                FrameScanView(image: scanViewModel.frame, isbnText: scanViewModel.isbnText ?? "nil")

                Button {
                    isActivated = true
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
                HStack {
                    AsyncImage(url: URL(string: scanViewModel.imageName ?? "moon"))
                        .frame(width: 100, height: 120, alignment: .center)
                    Text(scanViewModel.title ?? "not title")
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
