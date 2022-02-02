import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    private var mockNavigationController: MockNavigationController!
    
    override func setUp() {
        super.setUp()
        mockNavigationController = MockNavigationController()
    }
    
    override func tearDown() {
        myViewController = nil
        mockNavigationController = nil
        super.tearDown()
    }
}
