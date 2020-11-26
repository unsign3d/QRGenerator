//
//  QRViewModel.swift
//  QR generator
//
//  Created by lbruzzone on 26.11.20.
//

import Foundation
import Combine
import AppKit
import SwiftyImageIO

class QRViewModel : ObservableObject {
  @Published var text: String = "This is a QR code"

  
  func generateImage() -> CGImage? {
    return QRService.generateQR(text: text)!
  }
  
  func saveImage() {
    let qrData = generateImage()!
    let panel = NSSavePanel()
    panel.nameFieldLabel = "Save QR code image as:"
    panel.nameFieldStringValue = "qrcode.png"
    panel.canCreateDirectories = true
    panel.begin { response in
      if response == NSApplication.ModalResponse.OK, let fileUrl = panel.url {
        let imageDestination = ImageDestination(url: fileUrl, UTI: kUTTypePNG, imageCount: 1)!
        imageDestination.addImage(qrData)
        print(imageDestination.finalize())
      }
    }
  }
}
