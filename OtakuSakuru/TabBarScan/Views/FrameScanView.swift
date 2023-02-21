//
//  FrameScanView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 08/02/2023.
//

import SwiftUI

struct FrameScanView: View {
    @Environment (\.colorScheme) var colorSheme

    @State private var cameraActivate = false

        // image frame for recepted vision
    var image: CGImage?
    private let label = Text("Frame")

    var isbnText = "nil"

    var body: some View {
        if let image = image {
            Image(image, scale: 1.0, label: label)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 220, alignment: .center)
                .cornerRadius(15)
        } else {
            initialFrameEmpty
        }
    }

    struct FrameVisionView_Previews: PreviewProvider {
        static var previews: some View {
            FrameScanView()
        }
    }
}

private extension FrameScanView {
    var initialFrameEmpty: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(colorSheme == .light ? .sandJapan : .black)
            .frame(width: 300, height: 220, alignment: .center)
            .overlay {
                ZStack {
                        // create corner path rounded
                    Path() { path in
                        path.move(to: CGPoint(x: 20, y: 45))
                        path.addLine(to: CGPoint(x: 20, y: 28))
                        path.addCurve(to: CGPoint(x: 28, y: 20),
                                      control1: CGPoint(x: 20, y: 23),
                                      control2: CGPoint(x: 23, y: 20))
                        path.addLine(to: CGPoint(x: 45, y: 20))

                        path.move(to: CGPoint(x: 255, y: 20))
                        path.addLine(to: CGPoint(x: 272, y: 20))
                        path.addCurve(to: CGPoint(x: 280, y: 28),
                                      control1: CGPoint(x: 277, y: 20),
                                      control2: CGPoint(x: 280, y: 23))
                        path.addLine(to: CGPoint(x: 280, y: 45))

                        path.move(to: CGPoint(x: 255, y: 200))
                        path.addLine(to: CGPoint(x: 272, y: 200))
                        path.addCurve(to: CGPoint(x: 280, y: 192),
                                      control1: CGPoint(x: 277, y: 200),
                                      control2: CGPoint(x: 280, y: 197))
                        path.addLine(to: CGPoint(x: 280, y: 175))

                        path.move(to: CGPoint(x: 20, y: 175))
                        path.addLine(to: CGPoint(x: 20, y: 192))
                        path.addCurve(to: CGPoint(x: 28, y: 200),
                                      control1: CGPoint(x: 20, y: 197),
                                      control2: CGPoint(x: 23, y: 200))
                        path.addLine(to: CGPoint(x: 45, y: 200))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))

                    VStack {
                        Text("Scan the barcode")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(1)
                        Image(systemName: "barcode.viewfinder")
                            .font(.system(size: 35))
                    }
                }
                .foregroundColor(colorSheme == .light ? .redJapan : .indigoJapan)
            }
    }
}
