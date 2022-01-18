//
//  MockTabBarController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 21/06/2021.
//

import UIKit

/// A mock tab bar controller, used to capture the messages and parameters sent
/// to it.
public class MockTabBarController: UITabBarController {
    
    /// The view controller array received by the most recent call to
    /// `-setViewControllers:animated:`.
    private(set) public var receivedViewControllers: [UIViewController]?
    
    /// The `animated` flag received by the most recent call to
    /// `setViewControllers:animated:`.
    private(set) public var receivedSetViewControllersAnimatedFlag: Bool?
    
    public override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        receivedViewControllers = viewControllers
        receivedSetViewControllersAnimatedFlag = animated
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    /// The view controller received by the most recent call to
    /// `-presentViewController:animated:completion:`.
    private(set) public var receivedViewControllerForPresentation: UIViewController?
    
    /// The `animated` flag received by the most recent call to
    /// `presentViewController:animated:completion:`.
    private(set) public var receivedPresentViewControllerAnimatedFlag: Bool?
    
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedViewControllerForPresentation = viewControllerToPresent
        receivedPresentViewControllerAnimatedFlag = flag
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    /// The `animated` flag received by the most recent call to
    /// `dismissViewController:animated:completion:`.
    private(set) public var receivedDismissalAnimatedFlag: Bool?
    
    /// The `completion` closure received by the most recent call to
    /// `dismissViewController:animated:completion:`.
    private(set) public var receivedDismissalCompletionClosure: (() -> Void)?
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedDismissalAnimatedFlag = flag
        receivedDismissalCompletionClosure = completion
        super.dismiss(animated: flag, completion: completion)
    }
    
    /// The view controller that the receiver will return from
    /// `presentedViewController`, if any.
    public var overriddenPresentedViewController: UIViewController?
    
    public override var presentedViewController: UIViewController? {
        return overriddenPresentedViewController ?? super.presentedViewController
    }
    
    /// The mock transition coordinator returned by the receiver's
    /// `transitionCoordinator` property.
    public let mockTransitionCoordinator = MockTransitionCoordinator()
    
    public override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
        return mockTransitionCoordinator
    }
}
