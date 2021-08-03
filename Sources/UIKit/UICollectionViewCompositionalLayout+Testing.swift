//
//  UICollectionViewCompositionalLayout+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

import UIKit

@available(iOS 13.0, *)
public extension UICollectionViewCompositionalLayout {
    private typealias LayoutSectionProvider = @convention(block) (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
    
    /// Allows for the receiver's sections to be retrieved.
    /// - Parameters:
    ///   - index: The index of the section whose provider we wish to retrieve.
    ///   - layoutEnvironment: The layout environment to be passed to the
    ///   section provider.
    /// - Returns: The section at the given index.
    func section(atIndex index: Int, layoutEnvironment: NSCollectionLayoutEnvironment = MockCollectionLayoutEnvironment()) -> NSCollectionLayoutSection? {
        guard let block = value(forKey: "layoutSectionProvider") else { return nil }
        let blockPointer = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let layoutSectionProvider = unsafeBitCast(blockPointer, to: LayoutSectionProvider.self)
        return layoutSectionProvider(index, layoutEnvironment)
    }
}
