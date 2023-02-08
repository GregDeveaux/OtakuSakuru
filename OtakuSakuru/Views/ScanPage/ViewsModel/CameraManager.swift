//
//  CameraManager.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 08/02/2023.
//

import AVFoundation
import CoreImage

class CameraManager: ObservableObject {
    @Published var frame: CGImage?
    private var cameraAccessGranted = false

    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "OtakuSakuruSessionQueue")
    private let context = CIContext()

   /* override*/ init() {
//        super.init()
        checkPermission()
        self.captureSession.startRunning()
    }

    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                setUpCaptureSession()
                print("✅ Permission authorized for used of the camera.")
                return

                    // The system hasn't asked the user to allow access to the device.
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    DispatchQueue.main.async {
                        self.cameraAccessGranted = granted

                        if self.cameraAccessGranted {
                            self.setUpCaptureSession()
                            print("✅ Permission authorized for used of the camera.")
                        }
                    }
                }
                return

            case .denied:
                print("🛑 Permission denied for used of the camera.")
                return

            case .restricted:
                print("🛑 Permission not possible for used of the camera due to restriction.")
                return

            @unknown default:
                cameraAccessGranted = false
                fatalError("🛑 An error occurred while checking authorization status.")
        }
    }

    func setUpCaptureSession() {
        let videoOutput = AVCaptureVideoDataOutput()
        /// check cameraAccess
        guard cameraAccessGranted else { return }

        captureSession.beginConfiguration()
            /// check videoDevice that uses back camera to take video
        guard let videoDevice = AVCaptureDevice.default(.builtInDualWideCamera,
                                                        for: .video,
                                                        position: .back) else { return }
            /// check videoDeviceInput has received device information
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
            /// connected input of the camera
        captureSession.canAddInput(videoDeviceInput)
        captureSession.addInput(videoDeviceInput)

        guard captureSession.canAddOutput(videoOutput) else { return }
            // use a base quality for the video, enough to read the barcode
        captureSession.sessionPreset = .cif352x288
        captureSession.addOutput(videoOutput)
        videoOutput.connection(with: .video)?.videoOrientation = .portrait
        captureSession.commitConfiguration()
    }
}

extension CameraManager {
    private func imageFromSampleBuffer(_ sampleBuffer: CMSampleBuffer) -> CGImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }

        return cgImage
    }
}
