//
//  MockPresentationViewController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 24/05/2021.
//

import UIKit

/// A view controller that can be configured to return a view controller from
/// `presentedViewController`, and captures view controllers it is asked to
/// present.
public class MockPresentationViewController<T: UIViewController>: UIViewController {
    
    /// The view controller that the receiver will return from
    /// `presentedViewController`.
    public let overriddenPresentedViewController: T
    
    public override var presentedViewController: UIViewController? {
        return overriddenPresentedViewController
    }
    
    /// Initialises a mock presentation view controller with the given view
    /// controller as its `presentedViewController`.
    /// - Parameter overriddenPresentedViewController: The view controller to be
    /// used as the receiver's `presentedViewController`.
    public init(overriddenPresentedViewController: T) {
        self.overriddenPresentedViewController = overriddenPresentedViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// The view controller received by the most recent call to
    /// `-presentViewController:animated:completion:`.
    private(set) public var receivedViewControllerForPresentation: UIViewController?
    
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedViewControllerForPresentation = viewControllerToPresent
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
}
