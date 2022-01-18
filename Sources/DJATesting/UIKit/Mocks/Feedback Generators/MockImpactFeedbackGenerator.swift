//
//  MockImpactFeedbackGenerator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 02/06/2021.
//

import UIKit

#if os(iOS)

/// A mock impact feedback generator, used to capture the messages sent to it.
public class MockImpactFeedbackGenerator: UIImpactFeedbackGenerator {
    
    /// The feedback style that the receiver was initialised with.
    public let initialisedStyle: UIImpactFeedbackGenerator.FeedbackStyle
    
    public override init(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        initialisedStyle = style
        super.init(style: style)
    }
    
    /// A `Boolean` value indicating whether the `prepare` message was sent to
    /// the receiver.
    private(set) public var receivedPrepareMessage = false
    
    public override func prepare() {
        super.prepare()
        receivedPrepareMessage = true
        
    }
    
    /// A `Boolean` value indicating whether the `impactOccurred` message was
    /// sent to the receiver.
    private(set) public var receivedImpactOccuredMessage = false
    
    public override func impactOccurred() {
        super.impactOccurred()
        receivedImpactOccuredMessage = true
    }
    
    /// The `intensity` value received by a message to
    /// `impactOccurredWithIntensity:`, if any.
    private(set) public var receivedImpactOccuredIntensity: CGFloat?
    @available(iOS 13.0, *)
    public override func impactOccurred(intensity: CGFloat) {
        super.impactOccurred(intensity: intensity)
        receivedImpactOccuredIntensity = intensity
    }
}

#endif
