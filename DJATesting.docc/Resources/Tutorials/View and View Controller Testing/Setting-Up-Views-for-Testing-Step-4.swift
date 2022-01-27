final class UserView: UIView {
    private let user: User
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = "image_view"
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.accessibilityIdentifier = "name_label"
        return nameLabel
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.accessibilityIdentifier = "email_label"
        return emailLabel
    }()
    
    init(user: User) {
        self.user = user
        super.init(frame: .zero)
    }
}
