//
//  MockSelectionFeedbackGenerator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 02/06/2021.
//

import UIKit

#if os(iOS)

/// A mock selection feedback generator, used to capture the messages sent to
/// it.
public class MockSelectionFeedbackGenerator: UISelectionFeedbackGenerator {
    
    /// A `Boolean` value indicating whether the `prepare` message was sent to
    /// the receiver.
    private(set) public var receivedPrepareMessage = false
    
    public override func prepare() {
        super.prepare()
        receivedPrepareMessage = true
        
    }
    
    /// A `Boolean` value indicating whether the `selectionChanged` message was
    /// sent to the receiver.
    private(set) public var receivedSelectionChangedMessage = false
    
    public override func selectionChanged() {
        super.selectionChanged()
        receivedSelectionChangedMessage = true
    }
}

#endif
