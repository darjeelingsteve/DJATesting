//
//  MockNotificationFeedbackGenerator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 02/06/2021.
//

import UIKit

#if os(iOS)

/// A mock notification feedback generator, used to capture the messages sent to
/// it.
public class MockNotificationFeedbackGenerator: UINotificationFeedbackGenerator {
    
    /// A `Boolean` value indicating whether the `prepare` message was sent to
    /// the receiver.
    private(set) public var receivedPrepareMessage = false
    
    public override func prepare() {
        super.prepare()
        receivedPrepareMessage = true
        
    }
    
    /// The `notificationType` value received by a message to
    /// `notificationOccurred:`, if any.
    private(set) public var receivedNotificationType: UINotificationFeedbackGenerator.FeedbackType?
    
    public override func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        super.notificationOccurred(notificationType)
        receivedNotificationType = notificationType
    }
}

#endif
