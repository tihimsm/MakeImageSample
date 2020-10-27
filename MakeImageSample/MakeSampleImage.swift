//
//  MakeSampleImage.swift
//  MakeImageSample
//
//  Created by Taihei Mishima on 2020/10/27.
//  Copyright © 2020 Taihei Mishima. All rights reserved.
//

import UIKit

class MakeSampleImage {
    static func make() -> UIImage? {
        guard let qrCodeImage = UIImage.makeQRCode(text: "google.com") else {
            return nil
        }

        let marginAndFontSize: CGFloat = 20
        let font = UIFont.systemFont(ofSize: marginAndFontSize)
        let textAttributs = [
            NSAttributedString.Key.font: font
        ]

        let title = "Sample Title"
        let titleSize = title.size(font: font)
        let bodyViewWidth = qrCodeImage.size.height * 2
        let titleX: CGFloat = bodyViewWidth / 2 - (titleSize.width / 2)

        let bodyY = titleSize.height + marginAndFontSize
        let rightSectionWidth = qrCodeImage.size.width

        let company = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        let companyHeight = textAreaHeight(
            textSize: company.size(font: font),
            viewAreaWidth: rightSectionWidth)

        let name = "Taihei Mishima"
        let nameY = bodyY + companyHeight + marginAndFontSize
        let nameHeight = textAreaHeight(
            textSize: name.size(font: font),
            viewAreaWidth: rightSectionWidth)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年M月d日"
        let date = dateFormatter.string(from: Date())
        let dateY = nameY + nameHeight + marginAndFontSize
        let dateHeight = textAreaHeight(
            textSize: name.size(font: font),
            viewAreaWidth: rightSectionWidth)

        let bodyViewHeight = qrCodeImage.size.height > dateY + dateHeight
            ? qrCodeImage.size.height
            : dateY + dateHeight
        let bodyView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: bodyViewWidth,
            height: bodyViewHeight))
        bodyView.layer.borderWidth = 5
        bodyView.backgroundColor = .blue
        bodyView.layer.borderColor = UIColor.black.cgColor

        let imageRect = CGRect(
            x:0,
            y:0,
            width: bodyViewWidth,
            height: bodyY + bodyViewHeight)

        UIGraphicsBeginImageContext(imageRect.size)
        let titleTextRect = CGRect(
            x: titleX,
            y: 0,
            width: imageRect.width,
            height: titleSize.height)
        title.draw(in: titleTextRect, withAttributes: textAttributs)

        let bodyRect = CGRect(
            x: 0,
            y: bodyY,
            width: bodyViewWidth,
            height: bodyViewHeight
        )
        bodyView.draw(bodyRect)

        let qrCodeRect = CGRect(
            x: 0,
            y: bodyY,
            width: qrCodeImage.size.width,
            height: qrCodeImage.size.height)
        qrCodeImage.draw(in: qrCodeRect)

        let companyTextRect = CGRect(
            x: qrCodeRect.width,
            y: bodyY,
            width: rightSectionWidth,
            height: companyHeight)
        company.draw(in: companyTextRect, withAttributes: textAttributs)

        let nameTextRect = CGRect(
            x: qrCodeRect.width,
            y: nameY,
            width: rightSectionWidth,
            height: nameHeight)
        
        name.draw(in: nameTextRect, withAttributes: textAttributs)

        let dateTextRect = CGRect(
            x: qrCodeRect.width,
            y: dateY,
            width: rightSectionWidth,
            height: dateHeight)
        date.draw(in: dateTextRect, withAttributes: textAttributs)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }

    private static func textAreaHeight(textSize: CGSize, viewAreaWidth: CGFloat) -> CGFloat {
        let numberOfLines = ceil(textSize.width / viewAreaWidth)
        return textSize.height * numberOfLines
    }
}
