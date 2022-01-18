//
//  UICollectionViewCompositionalLayout+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

import UIKit

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
public extension UICollectionViewCompositionalLayout {
    private typealias LayoutSectionProvider = @convention(block) (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
    
    /// Allows for the receiver's sections to be retrieved.
    /// - Parameter index: The index of the section whose provider we wish to retrieve.
    /// - Returns: The section at the given index.
    func section(atIndex index: Int) -> NSCollectionLayoutSection? {
        /// Create an instance of `NSCollectionLayoutEnvironment`, which is
        /// declared as a class internally in UIKit, rather than just as a
        /// protocol as it would appear publicly.
        let layoutEnvironmentClass = NSClassFromString("NSCollectionLayoutEnvironment") as! NSObject.Type
        let layoutEnvironment = layoutEnvironmentClass.init() as! NSCollectionLayoutEnvironment
        
        /// Access the container that is generated internally by the layout and
        /// passed to layout environments by the layout object.
        /// Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=UICollectionViewCompositionalLayout.h
        let collectionLayoutContainer = value(forKey: "_containerFromCollectionView")
        
        /// Set the collection view container as the `container` in the layout
        /// environment.
        /// Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=NSCollectionLayoutEnvironment.h
        (layoutEnvironment as! NSObject).setValue(collectionLayoutContainer, forKey: "_container")
        return section(atIndex: index, layoutEnvironment: layoutEnvironment)
    }
    
    /// Allows for the receiver's sections to be retrieved.
    /// - Parameters:
    ///   - index: The index of the section whose provider we wish to retrieve.
    ///   - layoutEnvironment: The layout environment to be passed to the
    ///   section provider.
    /// - Returns: The section at the given index.
    func section(atIndex index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        guard let block = value(forKey: "layoutSectionProvider") else { return nil }
        let blockPointer = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let layoutSectionProvider = unsafeBitCast(blockPointer, to: LayoutSectionProvider.self)
        return layoutSectionProvider(index, layoutEnvironment)
    }
}
