//
//  MockNotificationFeedbackGenerator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 02/06/2021.
//

import UIKit

#if os(iOS)

public class MockNotificationFeedbackGenerator: UINotificationFeedbackGenerator {
    private(set) public var receivedPrepareMessage = false
    public override func prepare() {
        super.prepare()
        receivedPrepareMessage = true
        
    }
    
    private(set) public var receivedNotificationType: UINotificationFeedbackGenerator.FeedbackType?
    public override func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        super.notificationOccurred(notificationType)
        receivedNotificationType = notificationType
    }
}

#endif
