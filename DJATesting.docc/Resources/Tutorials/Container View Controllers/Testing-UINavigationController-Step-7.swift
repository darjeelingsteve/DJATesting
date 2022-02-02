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
    
    private func givenAViewController() {
        let users = try! [User].from(fileName: "DummyUsers", inBundle: Bundle(for: UserViewControllerTests.self))
        userViewController = UserViewController(user: users[0], childNavigationController: mockNavigationController)
    }
    
    private func whenTheViewLoads() {
        userViewController.loadViewIfNeeded()
    }
}
