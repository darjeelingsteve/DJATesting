//
//  UICollectionViewLayout+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

import UIKit

public extension UICollectionViewLayout {
    
    /// The dictionary used by the receiver to store the decoration view classes
    /// keyed by their element kind.
    ///
    /// For example, if the following code is used to register a decoration
    /// view:
    /// ```
    /// let layout = UICollectionViewCompositionalLayout…
    /// layout.register(BackgroundReusableView.self, forDecorationViewOfKind: "background")
    /// ```
    /// Then this property will contain the `BackgroundReusableView`, keyed by
    /// `"background"`.
    var decorationViewClassesDictionary: [String: AnyClass] {
        value(forKey: "decorationViewClassDict") as! [String: AnyClass]
    }
}
