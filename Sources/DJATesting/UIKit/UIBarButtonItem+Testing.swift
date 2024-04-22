//
//  UIBarButtonItem+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 25/06/2021.
//

#if !os(watchOS)

import UIKit

public extension UIBarButtonItem {
    
    /// The `UIBarButtonItem.SystemItem` that the reciever was initialised with,
    /// if any.
    var systemItem: UIBarButtonItem.SystemItem? {
        guard let rawValue = value(forKey: "systemItem") as? Int else { return nil }
        return UIBarButtonItem.SystemItem(rawValue: rawValue)
    }
    
    /// Simulates the user tapping on the receiver.
    func simulateTap() {
        if #available(iOS 13.0, *), let uiAction = value(forKey: "_primaryAction") as? UIAction {
            uiAction.invokeHandler()
        }
        else if let action = action {
            if action.description.contains(":") {
                _ = target?.perform(action, with: self)
            } else {
                _ = target?.perform(action)
            }
        }
    }
}

#endif
