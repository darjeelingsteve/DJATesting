//
//  MockNavigationController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 20/05/2021.
//

import UIKit

public class MockNavigationController: UINavigationController {
    private(set) public var receivedViewControllers: [UIViewController]?
    public override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        receivedViewControllers = viewControllers
    }
    
    private(set) public var pushedViewController: UIViewController?
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
    
    private(set) public var receivedPopViewControllerMessage = false
    public override func popViewController(animated: Bool) -> UIViewController? {
        receivedPopViewControllerMessage = true
        return super.popViewController(animated: animated)
    }
    
    private(set) public var receivedPopToViewController: UIViewController?
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        receivedPopToViewController = viewController
        return super.popToViewController(viewController, animated: animated)
    }
    
    private(set) public var receivedPopToRootViewControllerMessage = false
    public override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        receivedPopToRootViewControllerMessage = true
        return super.popToRootViewController(animated: animated)
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
}
