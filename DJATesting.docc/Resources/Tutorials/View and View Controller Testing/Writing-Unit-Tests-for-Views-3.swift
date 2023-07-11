import XCTest
import DJATesting
@testable import MyApp

final class UserViewTests: XCTestCase {
    private var userView: UserView!
    
    private func givenAUserView() {
        let users = try! [User].from(fileName: "DummyUsers", inBundle: Bundle(for: UserListDataSourceTests.self))
        userView = UserView(user: users[0])
    }
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
