//
//  MockTransitionCoordinator.swift
//  DJATesting
//
//  Created by Stephen Anthony on 24/05/2021.
//

import UIKit

/// A mock for injection in the place of a system provided transition animator.
public class MockTransitionCoordinator: NSObject, UIViewControllerTransitionCoordinator, UIViewControllerTransitionCoordinatorContext {
    public func notifyWhenInteractionEnds(_ handler: @escaping (UIViewControllerTransitionCoordinatorContext) -> Void) {}
    
    public func notifyWhenInteractionChanges(_ handler: @escaping (UIViewControllerTransitionCoordinatorContext) -> Void) {}
    
    public var isInteractive: Bool = false
    
    public var isAnimated: Bool = false
    
    public var presentationStyle: UIModalPresentationStyle = .none
    
    public var initiallyInteractive: Bool = false
    
    public var isInterruptible: Bool = false
    
    public var isCancelled: Bool = false
    
    public var transitionDuration: TimeInterval = 0.0
    
    public var percentComplete: CGFloat = 0.0
    
    public var completionVelocity: CGFloat = 0.0
    
    public var completionCurve: UIView.AnimationCurve = .linear
    
    public var containerView: UIView = UIView()
    
    public var targetTransform: CGAffineTransform = .identity
    
    private(set) public var receivedAnimationClosure: ((UIViewControllerTransitionCoordinatorContext) -> Void)?
    private(set) public var receivedCompletionClosure: ((UIViewControllerTransitionCoordinatorContext) -> Void)?
    public func animate(alongsideTransition animation: ((UIViewControllerTransitionCoordinatorContext) -> Void)?, completion: ((UIViewControllerTransitionCoordinatorContext) -> Void)? = nil) -> Bool {
        receivedAnimationClosure = animation
        receivedCompletionClosure = completion
        return false
    }
    
    public func animateAlongsideTransition(in view: UIView?, animation: ((UIViewControllerTransitionCoordinatorContext) -> Void)?, completion: ((UIViewControllerTransitionCoordinatorContext) -> Void)? = nil) -> Bool {
        return false
    }
    
    public func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
        return nil
    }
    
    public func view(forKey key: UITransitionContextViewKey) -> UIView? {
        return nil
    }
}
