//
//  MockTransitionCoordinatingViewController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 24/05/2021.
//

import UIKit

/// A view controller that returns a `MockTransitionCoordinator` for its
/// `transitionCoordinator`.
public class MockTransitionCoordinatingViewController: UIViewController {
    
    /// The mock transition coordinator returned by the receiver's
    /// `transitionCoordinator` property.
    public let mockTransitionCoordinator = MockTransitionCoordinator()
    
    public override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
        return mockTransitionCoordinator
    }
}
