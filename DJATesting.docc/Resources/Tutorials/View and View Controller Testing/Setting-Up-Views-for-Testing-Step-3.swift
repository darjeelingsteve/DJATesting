final class UserView: UIView {
    private let user: User
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        return nameLabel
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        return emailLabel
    }()
    
    init(user: User) {
        self.user = user
        super.init(frame: .zero)
    }
}
