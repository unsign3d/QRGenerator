//
//  QRViewModel.swift
//  QR generator
//
//  Created by lbruzzone on 26.11.20.
//

import Foundation
import Combine

class QRViewModel : ObservableObject {
  @Published var text: String = "This is a QR code"
  init() {}
  
  func generateImage() -> CGImage? {
    return QRService.generateQR(text: text)!
  }
}
