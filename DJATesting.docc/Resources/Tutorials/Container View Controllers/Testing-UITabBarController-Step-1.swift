import UIKit

final class MainSceneViewController: UIViewController {
    private let childTabBarController: UITabBarController
    
    init(childTabBarController: UITabBarController = UITabBarController()) {
        self.childTabBarController = childTabBarController
        super.init(nibName: nil, bundle: nil)
    }
}
