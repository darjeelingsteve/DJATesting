//
//  MockTabBarController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 21/06/2021.
//

#if !os(watchOS)

import UIKit

/// A mock tab bar controller, used to capture the messages and parameters sent
/// to it.
public class MockTabBarController: UITabBarController {
    
    /// A `Boolean` value indicating whether the receiver calls its superclass
    /// implementations when it receives messages for overridden methods. The
    /// default value is `true`.
    public var callsSuper = true
    
    /// The view controller array received by the most recent call to
    /// `-setViewControllers:animated:`.
    private(set) public var receivedViewControllers: [UIViewController]?
    
    /// The `animated` flag received by the most recent call to
    /// `setViewControllers:animated:`.
    private(set) public var receivedSetViewControllersAnimatedFlag: Bool?
    
    public override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        receivedViewControllers = viewControllers
        receivedSetViewControllersAnimatedFlag = animated
        if callsSuper {
            super.setViewControllers(viewControllers, animated: animated)
        }
    }
    
    /// The view controller received by the most recent call to
    /// `-showViewController:sender:`.
    private(set) public var receivedShowViewController: UIViewController?
    
    /// The sender received by the most recent call to
    /// `-showViewController:sender:`.
    private(set) public var receivedShowViewControllerSender: Any?
    
    public override func show(_ vc: UIViewController, sender: Any?) {
        receivedShowViewController = vc
        receivedShowViewControllerSender = sender
        if callsSuper {
            super.show(vc, sender: sender)
        }
    }
    
    /// The view controller received by the most recent call to
    /// `-showDetailViewController:sender:`.
    private(set) public var receivedShowDetailViewController: UIViewController?
    
    /// The sender received by the most recent call to
    /// `-showDetailViewController:sender:`.
    private(set) public var receivedShowDetailViewControllerSender: Any?
    
    public override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        receivedShowDetailViewController = vc
        receivedShowDetailViewControllerSender = sender
        if callsSuper {
            super.showDetailViewController(vc, sender: sender)
        }
    }
    
    /// A `Boolean` value indicating whether a message to
    /// `presentViewController:animated:completion:` has been received.
    private(set) public var receivedPresentViewControllerMessage = false
    
    /// The view controller received by the most recent call to
    /// `-presentViewController:animated:completion:`.
    private(set) public var receivedViewControllerForPresentation: UIViewController?
    
    /// The `animated` flag received by the most recent call to
    /// `presentViewController:animated:completion:`.
    private(set) public var receivedPresentViewControllerAnimatedFlag: Bool?
    
    /// The `completion` closure received by the most recent call to
    /// `presentViewController:animated:completion:`.
    private(set) public var receivedPresentationCompletionClosure: (() -> Void)?
    
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedPresentViewControllerMessage = true
        receivedViewControllerForPresentation = viewControllerToPresent
        receivedPresentViewControllerAnimatedFlag = flag
        receivedPresentationCompletionClosure = completion
        if callsSuper {
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
    
    /// A `Boolean` value indicating whether a message to
    /// `dismissViewController:animated:completion:` has been received.
    private(set) public var receivedDismissViewControllerMessage = false
    
    /// The `animated` flag received by the most recent call to
    /// `dismissViewController:animated:completion:`.
    private(set) public var receivedDismissalAnimatedFlag: Bool?
    
    /// The `completion` closure received by the most recent call to
    /// `dismissViewController:animated:completion:`.
    private(set) public var receivedDismissalCompletionClosure: (() -> Void)?
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedDismissViewControllerMessage = true
        receivedDismissalAnimatedFlag = flag
        receivedDismissalCompletionClosure = completion
        if callsSuper {
            super.dismiss(animated: flag, completion: completion)
        }
    }
    
    /// The view controller that the receiver will return from
    /// `presentedViewController`, if any.
    public var overriddenPresentedViewController: UIViewController?
    
    public override var presentedViewController: UIViewController? {
        return overriddenPresentedViewController ?? (callsSuper ? super.presentedViewController : nil)
    }
    
    /// The mock transition coordinator returned by the receiver's
    /// ``transitionCoordinator`` property when
    /// ``usesMockTransitionCoordinator`` is `true`.
    public let mockTransitionCoordinator = MockTransitionCoordinator()
    
    /// A `Boolean` value determining whether ``mockTransitionCoordinator`` will
    /// be returned from ``transitionCoordinator`` or not. Defaults to `true`.
    public var usesMockTransitionCoordinator = true
    
    public override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
        return usesMockTransitionCoordinator ? mockTransitionCoordinator : super.transitionCoordinator
    }
}

#endif
