//
//  PresentationCapturingViewController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 24/05/2021.
//

import UIKit

/// A view controller that captures any presented view controllers of a
/// particular type that it is asked to present.
public class PresentationCapturingViewController<ViewControllerType: UIViewController>: UIViewController {
    
    /// The view controller that the receiver was asked to present.
    private(set) public var presentedController: ViewControllerType?
    
    public override func present(_ viewControllerToPresent: UIViewController, animated _: Bool, completion _: (() -> Void)? = nil) {
        presentedController = viewControllerToPresent as? ViewControllerType
    }
    
    private(set) public var receivedDismissMessage = false
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        receivedDismissMessage = true
    }
}
