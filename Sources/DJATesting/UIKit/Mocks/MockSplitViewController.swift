//
//  MockSplitViewController.swift
//  MockSplitViewController
//
//  Created by Stephen Anthony on 08/09/2021.
//

import UIKit

@available(iOS 14.0, *)
@available(tvOS 14.0, *)
public class MockSplitViewController: UISplitViewController {
    private(set) public var receivedCompactColumnViewController: UIViewController?
    private(set) public var receivedPrimaryColumnViewController: UIViewController?
    private(set) public var receivedSecondaryColumnViewController: UIViewController?
    private(set) public var receivedSupplementaryColumnViewController: UIViewController?
    
    override public func setViewController(_ vc: UIViewController?, for column: UISplitViewController.Column) {
        switch column {
        case .compact:
            receivedCompactColumnViewController = vc
        case .primary:
            receivedPrimaryColumnViewController = vc
        case .secondary:
            receivedSecondaryColumnViewController = vc
        case .supplementary:
            receivedSecondaryColumnViewController = vc
        @unknown default:
            break
        }
    }
    
    private(set) public var receivedHiddenColumn: UISplitViewController.Column?
    override public func hide(_ column: UISplitViewController.Column) {
        receivedHiddenColumn = column
        super.hide(column)
    }
    
    private(set) public var receivedShownColumn: UISplitViewController.Column?
    public override func show(_ column: UISplitViewController.Column) {
        receivedShownColumn = column
        super.show(column)
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
