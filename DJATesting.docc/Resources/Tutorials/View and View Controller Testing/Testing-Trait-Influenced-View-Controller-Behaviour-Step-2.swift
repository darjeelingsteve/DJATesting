final class UserViewController: UIViewController {
    let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        title = traitCollection.horizontalSizeClass == .regular ? user.firstName : nil
    }
}
