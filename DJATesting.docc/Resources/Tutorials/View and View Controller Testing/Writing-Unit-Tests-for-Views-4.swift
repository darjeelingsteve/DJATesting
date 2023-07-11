import XCTest
import DJATesting
@testable import MyApp

final class UserViewTests: XCTestCase {
    private var userView: UserView!
    
    func testItDisplaysTheCorrectUserImage() {
        givenAUserView()
        XCTAssertEqual(userView.imageView.image, UIImage(named: "GreggWallace", in: Bundle(for: UserView.self), with: nil))
    }
    
    func testItDisplaysTheCorrectUserName() {
        givenAUserView()
        XCTAssertEqual(userView.nameLabel.text, "Gregg Wallace")
    }
    
    func testItDisplaysTheCorrectUserEmail() {
        givenAUserView()
        XCTAssertEqual(userView.emailLabel.text, "gregg@puddinglovers.com")
    }
    
    private func givenAUserView() {
        let users = try! [User].from(fileName: "DummyUsers", inBundle: Bundle(for: UserViewTests.self))
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
