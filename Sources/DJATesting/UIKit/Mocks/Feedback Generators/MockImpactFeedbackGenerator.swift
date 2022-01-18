//
//  MockImpactFeedbackGenerator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 02/06/2021.
//

import UIKit

#if os(iOS)

public class MockImpactFeedbackGenerator: UIImpactFeedbackGenerator {
    public let initialisedStyle: UIImpactFeedbackGenerator.FeedbackStyle
    
    public override init(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        initialisedStyle = style
        super.init(style: style)
    }
    
    private(set) public var receivedPrepareMessage = false
    public override func prepare() {
        super.prepare()
        receivedPrepareMessage = true
        
    }
    
    private(set) public var receivedImpactOccuredMessage = false
    public override func impactOccurred() {
        super.impactOccurred()
        receivedImpactOccuredMessage = true
    }
    
    private(set) public var receivedImpactOccuredIntensity: CGFloat?
    @available(iOS 13.0, *)
    public override func impactOccurred(intensity: CGFloat) {
        super.impactOccurred(intensity: intensity)
        receivedImpactOccuredIntensity = intensity
    }
}

#endif
