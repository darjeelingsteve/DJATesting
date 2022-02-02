import UIKit

final class UserViewController: UIViewController {
    let user: User
    private let childNavigationController: UINavigationController
    
    init(user: User, childNavigationController: UINavigationController = UINavigationController()) {
        self.user = user
        self.childNavigationController = childNavigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(childNavigationController)
        view.addSubview(childNavigationController.view)
        childNavigationController.didMove(toParent: self)
        
        let userDetailsViewController = UserDetailsViewController(user: user)
        userDetailsViewController.delegate = self
        childNavigationController.setViewControllers([userDetailsViewController], animated: false)
    }
}

extension UserViewController: UserDetailsViewControllerDelegate {
    func userDetailsViewControllerRequestingEmailBeSentToUser(_ userDetailsViewController: UserDetailsViewController) {
        let emailViewController = EmailViewController(emailAddress: userDetailsViewController.user.emailAddress)
        childNavigationController.pushViewController(emailViewController, animated: true)
    }
}
