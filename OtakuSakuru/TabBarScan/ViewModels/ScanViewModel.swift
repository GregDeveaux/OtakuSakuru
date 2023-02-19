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
    var cameraIsActivate = false
        // ISBN
    @Published var isbnText: String?
    var isbnFound = false
        // retrieve infomations to the manga
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

        // -------------------------------------------------------
        // MARK: - retrieve info by ISBN
        // -------------------------------------------------------

    func getData(ISBN: String) {
        API.QueryService.shared.getData(endpoint: .googleBook(ISBN: ISBN), type: API.GoogleBook.ISBN.self) { [weak self] result in
            switch result {
                case .failure(let error):
                    print("🛑 SCAN_VM/DATA_ISBN: \(error.localizedDescription)")
                case .success(let result):
                    self?.title = result.items[0].volumeInfo.title
                    self?.imageName = "https://www.canalbd.net/img/couvpage/54/\(self?.isbnText ?? "Nothing")_cg.jpg"
                    print("✅ SCAN_VM/DATA_ISBN: The ISBN give the result: \(result)")
            }
        }
    }
}

