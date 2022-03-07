//
//  MockCollectionLayoutContainer.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

#if !os(watchOS)

import UIKit

/// Allows a layout container to be constructed and populated for passing to an
/// object conforming to `NSCollectionLayoutEnvironment`.
@available(iOS 11.0, *)
@available(tvOS 11.0, *)
public class MockCollectionLayoutContainer: NSObject, NSCollectionLayoutContainer {
    
    /// The content size that the receiver was initialised with.
    public let contentSize: CGSize
    
    /// The effective content size that the receiver was initialised with.
    public let effectiveContentSize: CGSize
    
    /// The content insets that the receiver was initialised with.
    public let contentInsets: NSDirectionalEdgeInsets
    
    /// The effective content insets that the receiver was initialised with.
    public let effectiveContentInsets: NSDirectionalEdgeInsets

    public init(contentSize: CGSize = .zero, effectiveContentSize: CGSize = .zero, contentInsets: NSDirectionalEdgeInsets = .zero, effectiveContentInsets: NSDirectionalEdgeInsets = .zero) {
        self.contentSize = contentSize
        self.effectiveContentSize = effectiveContentSize
        self.contentInsets = contentInsets
        self.effectiveContentInsets = effectiveContentInsets
    }
    
    public convenience override init() {
        self.init(contentSize: .zero, effectiveContentSize: .zero, contentInsets: .zero, effectiveContentInsets: .zero)
    }
}

#endif
