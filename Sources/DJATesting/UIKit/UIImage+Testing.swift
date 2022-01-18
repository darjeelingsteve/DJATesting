//
//  UIImage+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 18/05/2021.
//

import UIKit

public extension UIImage {
    
    /// Allows the creation of an image of the given colour and size.
    /// - Parameters:
    ///   - colour: The colour of the image.
    ///   - size: The size of the image.
    /// - Returns: An image of the given colour and size.
    static func image(ofColour colour: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            colour.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
