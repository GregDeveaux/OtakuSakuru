//
//  CameraManager.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 12/02/2023.
//

import AVFoundation

class CameraManager: ObservableObject {
    // represent all possible errors
    /// use @Published to follow by all the objects
  @Published var error: CameraError?
    // to send the camera images to the appropriate data outputs

  let session = AVCaptureSession()
    // to change any of the camera configurations
  private let sessionQueue = DispatchQueue(label: "otakuSakuru.SessionQueue")
    // the video data output

  private let videoOutput = AVCaptureVideoDataOutput()

  private var status = Status.unconfigured

  enum Status {
    case unconfigured
    case configured
    case unauthorized
    case failed
  }

  static let shared = CameraManager()

  private init() {
    configure()
  }

  private func configure() {
    checkPermissions()
    sessionQueue.async {
      self.configureCaptureSession()
      self.session.startRunning()
    }
  }
    // pass error in the main thread
  private func set(error: CameraError?) {
    DispatchQueue.main.async {
      self.error = error
    }
  }
    // frameManager will be able to set itself as the delegate that receives that camera data.
  func set(_ delegate: AVCaptureVideoDataOutputSampleBufferDelegate, queue: DispatchQueue) {
    sessionQueue.async {
      self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
    }
  }

  private func checkPermissions() {
    // activate the permission for the video
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .notDetermined:
      // If undetermined, we suspend the session queue and have iOS request permission to use the camera
      sessionQueue.suspend()
      AVCaptureDevice.requestAccess(for: .video) { authorized in
        // user unauthorized the camera access
        if !authorized {
          self.status = .unauthorized
          self.set(error: .deniedAuthorization)
        }
        self.sessionQueue.resume()
      }
    case .restricted:
      status = .unauthorized
      set(error: .restrictedAuthorization)
    case .denied:
      status = .unauthorized
      set(error: .deniedAuthorization)
    case .authorized:
      break
    @unknown default:
      status = .unauthorized
      set(error: .unknownAuthorization)
    }
  }

  private func configureCaptureSession() {
    guard status == .unconfigured else { return }
    session.beginConfiguration()
    defer {
      session.commitConfiguration()
    }

      // choose the camera properties (front or back or both)
    let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                         for: .video,
                                         position: .back)
    guard let camera = device else {
      set(error: .cameraUnavailable)
      status = .failed
      return
    }

    do {
        // create input of camera
      let cameraInput = try AVCaptureDeviceInput(device: camera)
        // check the camera input is possible
      if session.canAddInput(cameraInput) {
        session.addInput(cameraInput)
      } else {
        set(error: .cannotAddInput)
        status = .failed
        return
      }
    } catch {
      set(error: .createCaptureInput(error))
      status = .failed
      return
    }
      // check the camera output is possible
    if session.canAddOutput(videoOutput) {
      session.addOutput(videoOutput)
        // set the format type for the video output
      videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        // force the orientation to be in portrait.
      let videoConnection = videoOutput.connection(with: .video)
      videoConnection?.videoOrientation = .portrait
    } else {
      set(error: .cannotAddOutput)
      status = .failed
      return
    }
    status = .configured
  }


}

