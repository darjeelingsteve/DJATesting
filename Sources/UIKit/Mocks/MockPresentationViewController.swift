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
    public override var presentedViewController: UIViewController? {
        return overriddenPresentedViewController
    }
    
    private let overriddenPresentedViewController: T
    
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
    
    private(set) public var receivedViewControllerForPresentation: UIViewController?
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedViewControllerForPresentation = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
