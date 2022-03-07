//
//  MockViewControllerTransitionCoordinatorContext.swift
//  DJATesting
//
//  Created by Stephen Anthony on 24/05/2021.
//

#if !os(watchOS)

import UIKit

/// A mock transition context that can be used when mocking a transition
/// coordinator.
public class MockViewControllerTransitionCoordinatorContext: NSObject, UIViewControllerTransitionCoordinatorContext {
    public var isAnimated: Bool = false
    
    public var presentationStyle: UIModalPresentationStyle = .none
    
    public var initiallyInteractive: Bool = false
    
    public var isInterruptible: Bool = false
    
    public var isInteractive: Bool = false
    
    public var isCancelled: Bool = false
    
    public var transitionDuration: TimeInterval = 0
    
    public var percentComplete: CGFloat = 0
    
    public var completionVelocity: CGFloat = 0
    
    public var completionCurve: UIView.AnimationCurve = .linear
    
    public var containerView: UIView = UIView()
    
    public var targetTransform: CGAffineTransform = .identity
    
    public func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
        return nil
    }
    
    public func view(forKey key: UITransitionContextViewKey) -> UIView? {
        return nil
    }
}

#endif
