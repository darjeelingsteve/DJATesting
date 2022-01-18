//
//  TraitCollectionOverridingViewController.swift
//  DJATesting
//
//  Created by Stephen Anthony on 09/08/2021.
//

import UIKit

/// A view controller that allows the trait colleciton to be overriden for a
/// specific view or view controller.
public class TraitCollectionOverridingViewController: UIViewController {
    
    /// Creates a view controller that overrides the trait collection for a
    /// specific view.
    /// - Parameters:
    ///   - overridenTraits: The trait collection used for the override.
    ///   - view: The view whose trait collection will be overriden.
    public init(overridenTraits: UITraitCollection, forView view: UIView) {
        super.init(nibName: nil, bundle: nil)
        let hostedViewController = ViewHostingViewController(hostedView: view)
        addChildViewController(hostedViewController, overridingTraitsWithTraits: overridenTraits)
    }
    
    
    /// Creates a view controller that overrides the trait collection for a
    /// specific view controller.
    /// - Parameters:
    ///   - overridenTraits: The trait collection used for the override.
    ///   - viewController: The view controller whose trait collection will be
    ///   overriden.
    public init(overridenTraits: UITraitCollection, forViewController viewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        addChildViewController(viewController, overridingTraitsWithTraits: overridenTraits)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addChildViewController(_ childViewController: UIViewController, overridingTraitsWithTraits traitCollection: UITraitCollection) {
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
        setOverrideTraitCollection(traitCollection, forChild: childViewController)
    }
}

private final class ViewHostingViewController: UIViewController {
    private let hostedView: UIView
    init(hostedView: UIView) {
        self.hostedView = hostedView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = hostedView
    }
}
