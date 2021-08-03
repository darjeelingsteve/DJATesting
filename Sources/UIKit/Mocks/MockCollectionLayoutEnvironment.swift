//
//  MockCollectionLayoutEnvironment.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

import UIKit

/// Allows for the creation of a collection layout environment, which is needed
/// when testing collection view compositional layout sections.
@available(iOS 13.0, *)
public class MockCollectionLayoutEnvironment: NSObject, NSCollectionLayoutEnvironment {
    public let container: NSCollectionLayoutContainer
    public let traitCollection: UITraitCollection

    public init(container: NSCollectionLayoutContainer = MockCollectionLayoutContainer(), traitCollection: UITraitCollection = UITraitCollection()) {
        self.container = container
        self.traitCollection = traitCollection
    }
}
