//
//  MockCollectionLayoutEnvironment.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

#if !os(watchOS)

import UIKit

/// Allows for the creation of a collection layout environment, which is needed
/// when testing collection view compositional layout sections.
@available(iOS 13.0, *)
@available(tvOS 13.0, *)
public class MockCollectionLayoutEnvironment: NSObject, NSCollectionLayoutEnvironment {
    
    /// The layout container that the receiver was initialised with.
    public let container: NSCollectionLayoutContainer
    
    /// The trait collection that the receiver was initialised with.
    public let traitCollection: UITraitCollection

    public init(container: NSCollectionLayoutContainer = MockCollectionLayoutContainer(), traitCollection: UITraitCollection = UITraitCollection()) {
        self.container = container
        self.traitCollection = traitCollection
    }
}

#endif
