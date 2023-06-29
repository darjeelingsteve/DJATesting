import UIKit

final class MainSceneViewController: UIViewController {
    private let childTabBarController: UITabBarController
    
    init(childTabBarController: UITabBarController = UITabBarController()) {
        self.childTabBarController = childTabBarController
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(childTabBarController)
        view.addSubview(childTabBarController.view)
        childTabBarController.didMove(toParent: self)
        
        let setupViewController = SetupViewController()
        setupViewController.delegate = self
        childTabBarController.setViewControllers([setupViewController], animated: false)
    }
}

extension MainSceneViewController: SetupViewControllerDelegate {
    func setupViewControllerDidFinishAppSetup(_ setupViewController: SetupViewController) {
        childTabBarController.setViewControllers([HomeViewController(), FeedViewController()], animated: true)
    }
}
