//
//  ScanViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 07/02/2023.
//

import CoreImage
import Vision

class ScanViewModel: ObservableObject {
        // contain the image of FrameView
    @Published var frame: CGImage?
        // generate frame will come from FrameManager
    private let frameManager = FrameManager.shared

    @Published var isbnText: String?
    var isbnFound = false

    @Published var imageName: String?
    @Published var title: String?


    init() {
        setupSubscriptions()
    }

    func setupSubscriptions() {
            // check FrameManager
        frameManager.$current.receive(on: RunLoop.main)
            .compactMap { buffer in
                    // convert CVPixelBuffer to CGImage
                guard let image = CGImage.create(from: buffer) else { return nil }
                if !self.isbnFound {
                    self.recognizeBarcode(cgImage: image)
                }
                return image
            }
            // assign the output of the pipeline
            .assign(to: &$frame)
    }

        // -------------------------------------------------------
        // MARK: - recognized the barcode by image
        // -------------------------------------------------------

    func recognizeBarcode(cgImage: CGImage?) {
        guard let cgImage = cgImage else { return }

        let handler = VNImageRequestHandler(cgImage: cgImage)

        let request = VNDetectBarcodesRequest { request, error in
            guard let observations = request.results as? [VNBarcodeObservation], error == nil else { return }

            let result = observations.first?.payloadStringValue
            self.isbnText = result

            if result != nil {
                self.isbnFound = true
                self.getData(ISBN: self.isbnText ?? "nil")
            }
            print(result ?? "Not isbn")
        }
        
        request.revision = VNDetectBarcodesRequestRevision1

        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
    }

    func getData(ISBN: String) {
        API.QueryService.shared.getData(endpoint: .openlibrary(ISBN: ISBN), type: API.Openlibrary.ISBN.self) { result in
            switch result {
                case .failure(let error):
                    print("🛑 SCAN_VM/DATA_ISBN: \(error.localizedDescription)")
                case .success(let result):
                    self.imageName = result.cover.large
                    self.title = result.title
                    print("✅ SCAN_VM/DATA_ISBN: The ISBN give the result: \(result)")
            }
        }
    }
}

