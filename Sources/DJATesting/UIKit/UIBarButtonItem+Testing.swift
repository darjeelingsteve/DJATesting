//
//  UIBarButtonItem+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 25/06/2021.
//

import UIKit

public extension UIBarButtonItem {
    
    /// Simulates the user tapping on the receiver.
    func simulateTap() {
        guard let action = action else { return }
        if action.description.contains(":") {
            _ = target?.perform(action, with: self)
        } else {
            _ = target?.perform(action)
        }
    }
}
