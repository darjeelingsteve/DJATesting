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
}
