//
//  UIControl+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 18/05/2021.
//

#if !os(watchOS)

import UIKit

public extension UIControl {
    
    /// Sends the receiver's actions for the `.primaryActionTriggered` control
    /// event.
    func simulatePrimaryActionTriggered() {
        sendActions(for: .primaryActionTriggered)
    }
}

#endif
