//
//  ScanView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 07/02/2023.
//

import SwiftUI

struct ScanView: View {
    @Environment (\.colorScheme) var colorSheme

    @StateObject private var scanViewModel = ScanViewModel()
    @State private var isActivated = false

    var body: some View {

        GeometryReader { proxy in
            ZStack {
                Color.otakuBackground
                    .ignoresSafeArea()

                LogoWithHalo()
                    .position(x: proxy.size.width / 2,
                              y: proxy.size.height / 5.5)

                VStack {
                    FrameScanView(image: scanViewModel.frame, isbnText: scanViewModel.isbnText ?? "nil")
                        .position(x: proxy.size.width / 2,
                                  y: proxy.size.height / 2)

                    scanButton
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

private extension ScanView {
    var scanButton: some View {
        Button {
            isActivated = true
            scanViewModel.cameraIsActivate = true
            
            print("✅ ScanView/scanButton: Camera is activate")
        } label: {
            Circle()
                .frame(width: 90, height: 90, alignment: .center)
                .foregroundColor(colorSheme == .light ? Color.indigoJapan : Color.redJapan)
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
