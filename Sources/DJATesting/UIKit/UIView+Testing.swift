//
//  UIView+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 18/05/2021.
//

import UIKit

public extension UIView {
    
    /// Finds the subviews of a particular type.
    /// - Parameter type: The type of the subviews we wish to find.
    /// - Returns: The subviews of the given type, if any.
    func subviews<T: UIView>(ofType type: T.Type) -> [T] {
        return subviews(passing: { $0 is T }) as! [T]
    }

    /// Finds the subview of a particular type with a given accessibility
    /// identifier.
    /// - Parameter type: The type of the subview we wish to find.
    /// - Parameter accessibilityIdentifier: The accessibility identifier of the
    /// subview we wish to find.
    /// - Returns: The subview with the given type with the given accessibility
    /// identifier, if any.
    func subview<T: UIView>(ofType type: T.Type, withAccessibilityIdentifier accessibilityIdentifier: String) -> T? {
        return subviews(passing: { $0.accessibilityIdentifier == accessibilityIdentifier }).first as? T
    }
    
    /// Determines whether the receiver is visible or not. The receiver is
    /// deemed to be visible if it and all of its super views are not hidden.
    /// - Returns: A `Boolean` value indicating whether the receiver is visible
    /// or not.
    func dja_isVisible() -> Bool {
        guard !isHidden else { return false }
        var candidateSuperview = superview
        while let superview = candidateSuperview {
            if superview.isHidden {
                return false
            }
            candidateSuperview = superview.superview
        }
        return true
    }

    /// Finds the subviews that pass a particular test.
    /// - Parameters:
    ///   - test: The closure used to determine whether a subview is a match or
    ///   not.
    ///   - searchRecursively: A `Boolean` value indicating whether the search
    ///   should search the full subview tree, or just the immediate subviews of
    ///   the reveiver.
    private func subviews(passing test: (UIView) -> Bool) -> [UIView] {
        var subviewsPassingTest = [UIView]()
        subviews.forEach { subview in
            if test(subview) {
                subviewsPassingTest.append(subview)
            }
            subviewsPassingTest.append(contentsOf: subview.subviews(passing: test))
        }
        return subviewsPassingTest
    }
}

// MARK: - Pixel Colour Testing
public extension UIView {
    
    /// Returns the colour of the pixel at the given point in the receiver's
    /// coordinate space, drawn at 1x scale.
    /// - Parameter point: The point whose pixel colour we wish to retrieve.
    /// - Returns: The colour of the pixel at the given point.
    func pixelColour(atPoint point: CGPoint) -> UIColor {
        let imageRepresentation = self.imageRepresentation()
        let pointer = CFDataGetBytePtr(imageRepresentation.dataProvider!.data)!
        let offset = Int(4 * (point.y * bounds.width + point.x))
        
        let red = pointer[offset]
        let green = pointer[offset + 1]
        let blue = pointer[offset + 2]
        let alpha = pointer[offset + 3]
        return UIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: CGFloat(alpha) / 255.0)
    }
    
    private func imageRepresentation() -> CGImage {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil,
                                width: Int(bounds.size.width),
                                height: Int(bounds.size.height),
                                bitsPerComponent: 8,
                                bytesPerRow: Int(bounds.size.width) * 4,
                                space: colorSpace,
                                bitmapInfo: UInt32(bitmapInfo.rawValue))!
        UIGraphicsPushContext(context)
        draw(bounds)
        let image = context.makeImage()!
        UIGraphicsPopContext()
        return image
    }
}

public extension Array where Element: UIView {
    
    /// - Returns: A copy of the receiver with the elements ordered leftmost to
    /// rightmost.
    func orderedHorizontally() -> [Element] {
        return sorted { viewOne, viewTwo in
            viewOne.frame.origin.x < viewTwo.frame.origin.x
        }
    }
    
    /// - Returns: A copy of the receiver with the elements ordered bottom-most
    /// to topmost.
    func orderedVertically() -> [Element] {
        return sorted { viewOne, viewTwo in
            viewOne.frame.origin.y < viewTwo.frame.origin.y
        }
    }
}
