//
//  UIKeyCommand+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 09/09/2021.
//

#if !os(watchOS)

import UIKit

public extension UIKeyCommand {
    
    /// Simulates the user invoking the receiver.
    /// - Parameter responder: The responder to which the receiver's `action`
    /// should be sent.
    func simulateCommandInvocation(on responder: UIResponder) {
        guard let action = action else { return }
        if action.description.contains(":") {
            _ = responder.perform(action, with: self)
        } else {
            _ = responder.perform(action)
        }
    }
}

#endif
