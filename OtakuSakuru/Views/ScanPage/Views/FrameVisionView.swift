//
//  FrameVisionView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 08/02/2023.
//

import SwiftUI

struct FrameVisionView: View {
    @ObservedObject var recognizedBarcode = RecognizedBarcode()

        // image frame for recepted vision
    var image: CGImage?
    private let label = Text("Frame")

    var body: some View {
        ZStack(alignment: .bottom) {


            ZStack {
                Button {

                } label: {
                    Image(systemName: "barcode")
                        .resizable()
                        .scaledToFit()
                        .padding(13)
                        .frame(width: 60, height: 60)
                        .background{
                            Circle()
                                .fill(.yellow)
                        }
                }
            }
            .frame(alignment: .bottom)
            .padding(.bottom, 40)
        }
    }
}

struct FrameVisionView_Previews: PreviewProvider {
    static var previews: some View {
        FrameVisionView()
    }
}
