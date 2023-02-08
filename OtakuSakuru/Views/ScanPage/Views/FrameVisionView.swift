//
//  FrameVisionView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 08/02/2023.
//

import SwiftUI

struct FrameVisionView: View {
        // image frame for recepted vision
    var image: CGImage?
    private let label = Text("Frame")

    var body: some View {
        if let image = image {
            Image(image, scale: 1.0, orientation: .up, label: label)
        } else {
            Color.redJapan
        }
    }
}

struct FrameVisionView_Previews: PreviewProvider {
    static var previews: some View {
        FrameVisionView()
    }
}
