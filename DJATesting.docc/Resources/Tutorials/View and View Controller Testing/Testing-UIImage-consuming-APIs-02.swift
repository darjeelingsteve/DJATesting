import UIKit

final class BorderedImageView: UIView {
    var image: UIImage? {
        get { imageView.image }
        set { imageView.image = newValue}
    }

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = "image_view"
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        directionalLayoutMargins = .zero
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
}