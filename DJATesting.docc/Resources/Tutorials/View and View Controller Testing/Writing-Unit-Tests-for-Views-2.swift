import XCTest
import DJATesting
@testable import MyApp

final class UserViewTests: XCTestCase {
    private var userView: UserView!
}

private extension UserView {
    var imageView: UIImageView {
        subview(ofType: UIImageView.self, withAccessibilityIdentifier: "image_view")!
    }
    
    var nameLabel: UILabel {
        subview(ofType: UILabel.self, withAccessibilityIdentifier: "name_label")!
    }
    
    var emailLabel: UILabel {
        subview(ofType: UILabel.self, withAccessibilityIdentifier: "email_label")!
    }
}
