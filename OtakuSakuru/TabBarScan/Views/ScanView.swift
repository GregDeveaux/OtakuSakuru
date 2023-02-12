//
//  ScanView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 07/02/2023.
//

import SwiftUI

struct ScanView: View {
    @StateObject private var model = ContentViewModel()

    var body: some View {

        FrameVisionView(image: model.frame)

    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
