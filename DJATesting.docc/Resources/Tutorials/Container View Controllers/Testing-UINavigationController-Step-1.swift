import UIKit

final class UserViewController: UIViewController {
    let user: User
    private let childNavigationController: UINavigationController
    
    init(user: User, childNavigationController: UINavigationController = UINavigationController()) {
        self.user = user
        self.childNavigationController = childNavigationController
        super.init(nibName: nil, bundle: nil)
    }
}
