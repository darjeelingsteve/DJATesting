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

    func testItShowsTheCorrectViewControllersAtLaunch() {
        givenAViewController()
        whenTheViewLoads()
        XCTAssertEqual(mockTabBarController?.receivedViewControllers?.count, 1)
        XCTAssertFalse(receivedSetViewControllersAnimatedFlag)
        let setupViewController = mockTabBarController.receivedViewControllers?.first as? SetupViewController
        XCTAssertNotNil(setupViewController)
        XCTAssertIdentical(setupViewController.delegate, mainSceneViewController)
    }

    private func givenAViewController() {
        mainSceneViewController = MainSceneViewController(childTabBarController: mockTabBarController)
    }
    
    private func whenTheViewLoads() {
        mainSceneViewController.loadViewIfNeeded()
    }
}
