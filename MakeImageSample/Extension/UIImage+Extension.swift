//
//  UIImage+Extension.swift
//  MakeImageSample
//
//  Created by Taihei Mishima on 2020/10/27.
//  Copyright © 2020 Taihei Mishima. All rights reserved.
//

import UIKit

extension UIImage {
    static func makeQRCode(text: String) -> UIImage? {
        guard let data = text.data(using: .utf8) else { return nil }
        guard let QR = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data]) else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        guard let ciImage = QR.outputImage?.transformed(by: transform) else { return nil }
        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
