//
//  MockNavigationController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 20/05/2021.
//

import UIKit

public class MockNavigationController: UINavigationController {
    private(set) public var receivedViewControllers: [UIViewController]?
    private(set) public var receivedSetViewControllersAnimatedFlag: Bool?
    public override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        receivedViewControllers = viewControllers
        receivedSetViewControllersAnimatedFlag = animated
    }
    
    private(set) public var receivedPushedViewController: UIViewController?
    private(set) public var receivedPushViewControllerAnimatedFlag: Bool?
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        receivedPushedViewController = viewController
        receivedPushViewControllerAnimatedFlag = animated
    }
    
    private(set) public var receivedPopViewControllerMessage = false
    private(set) public var receivedPopViewControllerAnimatedFlag: Bool?
    public override func popViewController(animated: Bool) -> UIViewController? {
        receivedPopViewControllerMessage = true
        receivedPopViewControllerAnimatedFlag = animated
        return super.popViewController(animated: animated)
    }
    
    private(set) public var receivedPopToViewController: UIViewController?
    private(set) public var receivedPopToViewControllerAnimatedFlag: Bool?
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        receivedPopToViewController = viewController
        receivedPopToViewControllerAnimatedFlag = animated
        return super.popToViewController(viewController, animated: animated)
    }
    
    private(set) public var receivedPopToRootViewControllerMessage = false
    private(set) public var receivedPopToRootViewControllerAnimatedFlag: Bool?
    public override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        receivedPopToRootViewControllerMessage = true
        receivedPopToRootViewControllerAnimatedFlag = animated
        return super.popToRootViewController(animated: animated)
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
