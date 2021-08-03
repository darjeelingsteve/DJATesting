//
//  MockCollectionLayoutContainer.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

import UIKit

/// Allows a layout container to be constructed and populated for passing to an
/// object conforming to `NSCollectionLayoutEnvironment`.
@available(iOS 11.0, *)
public class MockCollectionLayoutContainer: NSObject, NSCollectionLayoutContainer {
    public let contentSize: CGSize
    public let effectiveContentSize: CGSize
    public let contentInsets: NSDirectionalEdgeInsets
    public let effectiveContentInsets: NSDirectionalEdgeInsets

    public init(contentSize: CGSize = .zero, effectiveContentSize: CGSize = .zero, contentInsets: NSDirectionalEdgeInsets = .zero, effectiveContentInsets: NSDirectionalEdgeInsets = .zero) {
        self.contentSize = contentSize
        self.effectiveContentSize = effectiveContentSize
        self.contentInsets = contentInsets
        self.effectiveContentInsets = effectiveContentInsets
    }
}
