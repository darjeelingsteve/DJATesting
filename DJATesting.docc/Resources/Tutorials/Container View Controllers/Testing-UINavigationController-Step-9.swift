import XCTest
import DJATesting
@testable import MyApp

final class UserViewControllerTests: XCTest {
    private var userViewController: UserViewController!
    private var mockNavigationController: MockNavigationController!
    
    override func setUp() {
        super.setUp()
        mockNavigationController = MockNavigationController()
    }
    
    override func tearDown() {
        userViewController = nil
        mockNavigationController = nil
        super.tearDown()
    }
    
    func testItShowsAUserDetailsViewControllerInItsChildNavigationController() {
        givenAViewController()
        whenTheViewLoads()
        let userDetailsViewController = mockNavigationController.receivedViewControllers?.first as? UserDetailsViewController
        XCTAssertEqual(userDetailsViewController?.user, userViewController.user)
        XCTAssertIdentical(userDetailsViewController?.delegate, userViewController)
    }
    
    func testItPushesAnEmailViewControllerWhenRequested() {
        givenAViewController()
        whenTheViewLoads()
        whenTheUserDetailsViewControllerRequestsAnEmailBeSent()
        let emailViewController = mockNavigationController.pushedViewController as? EmailViewController
        XCTAssertEqual(emailViewController?.emailAddress, userViewController.user.emailAddress)
    }
    
    private func givenAViewController() {
        let users = try! [User].from(fileName: "DummyUsers", inBundle: Bundle(for: UserViewControllerTests.self))
        userViewController = UserViewController(user: users[0], childNavigationController: mockNavigationController)
    }
    
    private func whenTheViewLoads() {
        userViewController.loadViewIfNeeded()
    }
    
    private func whenTheUserDetailsViewControllerRequestsAnEmailBeSent() {
        let userDetailsViewController = UserDetailsViewController(user: userViewController.user)
        userViewController.userDetailsViewControllerRequestingEmailBeSentToUser(userDetailsViewController)
    }
}
