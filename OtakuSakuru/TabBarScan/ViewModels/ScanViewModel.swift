//
//  ScanViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 07/02/2023.
//

import CoreImage

class ContentViewModel: ObservableObject {
  // contain the image of FrameView
  @Published var frame: CGImage?
  // generate frame will come from FrameManager
  private let frameManager = FrameManager.shared

  init() {
    setupSubscriptions()
  }

  func setupSubscriptions() {
      // check FrameManager
    frameManager.$current
      .receive(on: RunLoop.main)
      // convert CVPixelBuffer to CGImage
      .compactMap { buffer in
        return CGImage.create(from: buffer)
      }
      // assign the output of the pipeline
      .assign(to: &$frame)
  }
}

