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
                Color.otakuBackgroundPrimary
                    .ignoresSafeArea()

                LogoWithHalo()
                    .position(x: proxy.size.width / 2,
                              y: proxy.size.height / 5.5)

                VStack {
                    FrameScanView(image: scanViewModel.frame, isbnText: scanViewModel.isbnText ?? "nil")
                        .position(x: proxy.size.width / 2,
                                  y: proxy.size.height / 1.75)
                        .accessibilityAddTraits(.startsMediaSession)
                        .accessibilityLabel("This frame is modify after that to push the button and a camera is activate to scan the barcode")

                    scanButton
                        .accessibilityAddTraits(.isButton)
                        .accessibilityLabel("You activate the camera after push on the button camera and we stop it in push again.")
                }
                if scanViewModel.isbnFound {
                    ValidatePopupView(title: scanViewModel.title ?? "not title", isbn: scanViewModel.isbnText ?? "nil")
                }
            }
            .accessibilityAddTraits(.isSummaryElement)
            .accessibilityLabel("This page allows to add a manga in your collection by scan barcode.")
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
            if !isActivated {
                isActivated = true
                scanViewModel.cameraIsActivate.toggle() ///true
                scanViewModel.scanBarcode()
            } else {
                isActivated = false
                scanViewModel.cameraIsActivate.toggle() ///false
            }
            print("✅ SCAN_VIEW/SCAN_BUTTON: Camera is activate? \(scanViewModel.cameraIsActivate)")
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
        .padding(.bottom, 30)
    }
}
