//
//  MockSplitViewController.swift
//  MockSplitViewController
//
//  Created by Stephen Anthony on 08/09/2021.
//

import UIKit

@available(iOS 14.0, *)
@available(tvOS 14.0, *)
/// A mock split view controller, used to capture the messages and parameters
/// sent to it.
public class MockSplitViewController: UISplitViewController {
    
    /// The view controller received by the most recent call to
    /// `-setViewController:forColumn:` with a column value of
    /// `UISplitViewControllerColumnCompact`.
    private(set) public var receivedCompactColumnViewController: UIViewController?
    
    /// The view controller received by the most recent call to
    /// `-setViewController:forColumn:` with a column value of
    /// `UISplitViewControllerColumnPrimary`.
    private(set) public var receivedPrimaryColumnViewController: UIViewController?
    
    /// The view controller received by the most recent call to
    /// `-setViewController:forColumn:` with a column value of
    /// `UISplitViewControllerColumnSecondary`.
    private(set) public var receivedSecondaryColumnViewController: UIViewController?
    
    /// The view controller received by the most recent call to
    /// `-setViewController:forColumn:` with a column value of
    /// `UISplitViewControllerColumnSupplementary`.
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
    
    /// The `column` value received by the most recent call to `hideColumn:`.
    private(set) public var receivedHiddenColumn: UISplitViewController.Column?
    
    override public func hide(_ column: UISplitViewController.Column) {
        receivedHiddenColumn = column
        super.hide(column)
    }
    
    /// The `column` value received by the most recent call to `showColumn:`.
    private(set) public var receivedShownColumn: UISplitViewController.Column?
    
    public override func show(_ column: UISplitViewController.Column) {
        receivedShownColumn = column
        super.show(column)
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
