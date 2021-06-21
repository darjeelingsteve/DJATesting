//
//  MockTabBarController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 21/06/2021.
//

import UIKit

public class MockTabBarController: UITabBarController {
    private(set) public var receivedViewControllers: [UIViewController]?
    private(set) public var receivedViewControllersAnimationFlag: Bool?
    public override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        receivedViewControllers = viewControllers
        receivedViewControllersAnimationFlag = animated
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    private(set) public var receivedViewControllerForPresentation: UIViewController?
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedViewControllerForPresentation = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    private(set) public var receivedDismissalAnimatedFlag: Bool?
    private(set) public var receivedDismissalCompletionClosure: (() -> Void)?
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedDismissalAnimatedFlag = flag
        receivedDismissalCompletionClosure = completion
        super.dismiss(animated: flag, completion: completion)
    }
    
    /// The mock transition coordinator returned by the receiver's
    /// `transitionCoordinator` property.
    public let mockTransitionCoordinator = MockTransitionCoordinator()
    
    public override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
        return mockTransitionCoordinator
    }
}
