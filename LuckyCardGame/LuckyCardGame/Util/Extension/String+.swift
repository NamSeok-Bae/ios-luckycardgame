//
//  String+.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/07.
//

import UIKit

extension String {
    func emojiToImage(_ frameSize: CGSize, _ imageSize: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(frameSize, false, 0)
        UIColor.clear.set()

        let rect = CGRect(origin: .zero, size: frameSize)
        UIRectFill(CGRect(origin: .zero, size: frameSize))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: imageSize)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
