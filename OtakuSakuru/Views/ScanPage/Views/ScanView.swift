//
//  ScanView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 07/02/2023.
//

import SwiftUI

struct ScanView: View {
    var body: some View {
        VStack {
                // use lightmode or darkmode Background on the all screen
            Color.otakuBackground.ignoresSafeArea()

//            GeometryReader { proxy in
//                LogoWithHalo()
//            }

            Label("Scan the barcode", systemImage: "barcode")
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
