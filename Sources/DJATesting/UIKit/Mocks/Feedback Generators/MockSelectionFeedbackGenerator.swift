//
//  MockSelectionFeedbackGenerator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 02/06/2021.
//

import UIKit

#if os(iOS)

public class MockSelectionFeedbackGenerator: UISelectionFeedbackGenerator {
    private(set) public var receivedPrepareMessage = false
    public override func prepare() {
        super.prepare()
        receivedPrepareMessage = true
        
    }
    
    private(set) public var receivedSelectionChangedMessage = false
    public override func selectionChanged() {
        super.selectionChanged()
        receivedSelectionChangedMessage = true
    }
}

#endif
