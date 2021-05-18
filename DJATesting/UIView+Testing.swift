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
