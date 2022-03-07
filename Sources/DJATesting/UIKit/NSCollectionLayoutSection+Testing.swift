//
//  NSCollectionLayoutSection+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 03/08/2021.
//

#if !os(watchOS)

import UIKit

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
public extension NSCollectionLayoutSection {
    
    /// The receiver's layout group.
    var layoutGroup: NSCollectionLayoutGroup {
        value(forKey: "group") as! NSCollectionLayoutGroup
    }
    
#if os(iOS)
    /// Accesses the receiver's leading swipe actions configurations.
    /// - Parameter indexPath: The index path of the item whose leading swipe
    /// actions configuration we wish to access.
    /// - Returns: The leading swipe actions configuration for the given index
    /// path, if any.
    func leadingSwipeActionsConfiguration(atIndexPath indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=NSCollectionLayoutSection.h
        let swipeActionsConfiguration = perform(NSSelectorFromString("_leadingSwipeActionsConfigurationForIndexPath:"), with: indexPath)
        return swipeActionsConfiguration?.takeUnretainedValue() as? UISwipeActionsConfiguration
    }
    
    /// Accesses the receiver's trailing swipe actions configurations.
    /// - Parameter indexPath: The index path of the item whose trailing swipe
    /// actions configuration we wish to access.
    /// - Returns: The trailing swipe actions configuration for the given index
    /// path, if any.
    func trailingSwipeActionsConfiguration(atIndexPath indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=NSCollectionLayoutSection.h
        let swipeActionsConfiguration = perform(NSSelectorFromString("_trailingSwipeActionsConfigurationForIndexPath:"), with: indexPath)
        return swipeActionsConfiguration?.takeUnretainedValue() as? UISwipeActionsConfiguration
    }
#endif
}

#endif
