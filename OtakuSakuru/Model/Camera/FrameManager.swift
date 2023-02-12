//
//  FrameManager.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 12/02/2023.
//

import AVFoundation

class FrameManager: NSObject, ObservableObject {

  static let shared = FrameManager()

    // published property for the current frame received from the camera.
  @Published var current: CVPixelBuffer?

    // published property for the current frame received from the camera.
  let videoOutputQueue = DispatchQueue(label: "otakuSakuru.VideoOutputQueue",
                                       qos: .userInitiated,
                                       attributes: [],
                                       autoreleaseFrequency: .workItem)

    // Set FrameManager as the delegate to AVCaptureVideoDataOutput.
  private override init() {
    super.init()
    CameraManager.shared.set(self, queue: videoOutputQueue)
  }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
  func captureOutput(_ output: AVCaptureOutput,
                     didOutput sampleBuffer: CMSampleBuffer,
                     from connection: AVCaptureConnection) {
      if let buffer = sampleBuffer.imageBuffer {
        DispatchQueue.main.async {
          self.current = buffer
        }
      }
    }
}
