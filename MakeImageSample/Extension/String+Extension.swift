//
//  String+Extension.swift
//  MakeImageSample
//
//  Created by Taihei Mishima on 2020/10/27.
//  Copyright © 2020 Taihei Mishima. All rights reserved.
//

import UIKit

extension String {
    func size(font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return (self as NSString).size(withAttributes: attributes)
    }
}
