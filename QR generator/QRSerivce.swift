//
//  QRSerivce.swift
//  QR generator
//
//  Created by lbruzzone on 26.11.20.
//

import Foundation
import EFQRCode

class QRService {
  init() {}
  
  static func generateQR(text: String) -> CGImage? {
    return EFQRCode.generate(content: text)
  }
}
