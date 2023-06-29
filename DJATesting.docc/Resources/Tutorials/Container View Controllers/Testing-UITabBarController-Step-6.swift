import XCTest
import DJATesting
@testable import MyApp

final class MainSceneViewControllerTests: XCTest {
    private var mainSceneViewController: MainSceneViewController!
    private var mockTabBarController: MockTabBarController!
    
    override func setUp() {
        super.setUp()
        mockTabBarController = MockTabBarController()
    }
    
    override func tearDown() {
        mainSceneViewController = nil
        mockTabBarController = nil
        super.tearDown()
    }
}
