import XCTest
import DJATesting
@testable import MyApp

final class MainSceneViewControllerTests: XCTest {
    private var mainSceneViewController: MainSceneViewController!
    private var mockSplitViewController: MockSplitViewController!
    
    override func setUp() {
        super.setUp()
        mockSplitViewController = MockSplitViewController(style: .doubleColumn)
    }
    
    override func tearDown() {
        mainSceneViewController = nil
        mockSplitViewController = nil
        super.tearDown()
    }
}
