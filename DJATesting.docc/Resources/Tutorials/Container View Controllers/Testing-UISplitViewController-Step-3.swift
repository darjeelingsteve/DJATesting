import UIKit

final class MainSceneViewController: UIViewController {
    private let childSplitViewController: UISplitViewController
    
    init(childSplitViewController: UISplitViewController = UISplitViewController(style: .doubleColumn)) {
        childSplitViewController.preferredDisplayMode = .oneBesideSecondary
        childSplitViewController.preferredSplitBehavior = .tile
        self.childSplitViewController = childSplitViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(childSplitViewController)
        view.addSubview(childSplitViewController.view)
        childSplitViewController.didMove(toParent: self)
        
        childSplitViewController.setViewController(MenuViewController(), for: .primary)
        let homeViewController = HomeViewController()
        childSplitViewController.setViewController(homeViewController, for: .secondary)
        
        let compactTabBarController = UITabBarController()
        compactTabBarController.setViewControllers([HomeViewController(), MenuViewController()], animated: false)
        childSplitViewController.setViewController(compactTabBarController, for: .compact)
    }
}
