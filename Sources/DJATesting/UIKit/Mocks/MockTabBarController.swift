//
//  MockTabBarController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 21/06/2021.
//

import UIKit

public class MockTabBarController: UITabBarController {
    private(set) public var receivedViewControllers: [UIViewController]?
    private(set) public var receivedSetViewControllersAnimatedFlag: Bool?
    public override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        receivedViewControllers = viewControllers
        receivedSetViewControllersAnimatedFlag = animated
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    private(set) public var receivedViewControllerForPresentation: UIViewController?
    private(set) public var receivedPresentViewControllerAnimatedFlag: Bool?
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedViewControllerForPresentation = viewControllerToPresent
        receivedPresentViewControllerAnimatedFlag = flag
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    private(set) public var receivedDismissalAnimatedFlag: Bool?
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
