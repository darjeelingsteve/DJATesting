//
//  MockNavigationController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 20/05/2021.
//

import UIKit

/// A mock navigation controller, used to capture the messages and parameters
/// sent to it.
public class MockNavigationController: UINavigationController {
    
    /// The view controller array received by the most recent call to
    /// `-setViewControllers:animated:`.
    private(set) public var receivedViewControllers: [UIViewController]?
    
    /// The `animated` flag received by the most recent call to
    /// `setViewControllers:animated:`.
    private(set) public var receivedSetViewControllersAnimatedFlag: Bool?
    
    public override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        receivedViewControllers = viewControllers
        receivedSetViewControllersAnimatedFlag = animated
    }
    
    /// The view controller received by the most recent call to
    /// `-pushViewController:animated:`.
    private(set) public var receivedPushedViewController: UIViewController?
    
    /// The `animated` flag received by the most recent call to
    /// `pushViewController:animated:`.
    private(set) public var receivedPushViewControllerAnimatedFlag: Bool?
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        receivedPushedViewController = viewController
        receivedPushViewControllerAnimatedFlag = animated
    }
    
    /// A `Boolean` value indicating whether a message to
    /// `popViewControllerAnimated:` has been received.
    private(set) public var receivedPopViewControllerMessage = false
    
    /// The `animated` flag received by the most recent call to
    /// `popViewControllerAnimated:`.
    private(set) public var receivedPopViewControllerAnimatedFlag: Bool?
    
    public override func popViewController(animated: Bool) -> UIViewController? {
        receivedPopViewControllerMessage = true
        receivedPopViewControllerAnimatedFlag = animated
        return super.popViewController(animated: animated)
    }
    
    /// The view controller received by the most recent call to
    /// `-popToViewController:animated:`.
    private(set) public var receivedPopToViewController: UIViewController?
    
    /// The `animated` flag received by the most recent call to
    /// `popToViewController:animated:`.
    private(set) public var receivedPopToViewControllerAnimatedFlag: Bool?
    
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        receivedPopToViewController = viewController
        receivedPopToViewControllerAnimatedFlag = animated
        return super.popToViewController(viewController, animated: animated)
    }
    
    /// A `Boolean` value indicating whether a message to
    /// `popToRootViewControllerAnimated:` has been received.
    private(set) public var receivedPopToRootViewControllerMessage = false
    
    /// The `animated` flag received by the most recent call to
    /// `popToRootViewControllerAnimated:`.
    private(set) public var receivedPopToRootViewControllerAnimatedFlag: Bool?
    
    public override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        receivedPopToRootViewControllerMessage = true
        receivedPopToRootViewControllerAnimatedFlag = animated
        return super.popToRootViewController(animated: animated)
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
