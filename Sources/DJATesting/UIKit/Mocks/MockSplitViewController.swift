//
//  MockSplitViewController.swift
//  MockSplitViewController
//
//  Created by Stephen Anthony on 08/09/2021.
//

#if !os(watchOS)

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
    
    /// The view controller received by the most recent call to
    /// `-showViewController:sender:`.
    private(set) public var receivedShowViewController: UIViewController?
    
    /// The sender received by the most recent call to
    /// `-showViewController:sender:`.
    private(set) public var receivedShowViewControllerSender: Any?
    
    public override func show(_ vc: UIViewController, sender: Any?) {
        receivedShowViewController = vc
        receivedShowViewControllerSender = sender
        super.show(vc, sender: sender)
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
        super.showDetailViewController(vc, sender: sender)
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

#endif
