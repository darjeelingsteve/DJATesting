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
    
    func testItShowsTheCorrectViewControllersWhenExpanded() {
        givenAViewController()
        whenTheViewLoads()
        let primaryMenuViewController = childSplitViewController.receivedPrimaryColumnViewController as? MenuViewController
        let secondaryHomeViewController = childSplitViewController.receivedSecondaryColumnViewController as? HomeViewController
        XCTAssertNotNil(primaryMenuViewController)
        XCTAssertNotNil(secondaryHomeViewController)
    }
    
    func testItShowsTheCorrectViewControllerWhenCollapsed() {
        givenAViewController()
        whenTheViewLoads()
        let compactTabViewController = childSplitViewController.receivedCompactColumnViewController as? UITabBarController
        XCTAssertNotNil(compactTabViewController)
        let homeTabViewController = compactTabViewController?.viewControllers?.first
        let menuTabViewController = compactTabViewController?.viewControllers?.last
        XCTAssertNotNil(homeTabViewController)
        XCTAssertNotNil(menuTabViewController)
    }
    
    private func givenAViewController() {
        mainSceneViewController = MainSceneViewController(childSplitViewController: mockSplitViewController)
    }
    
    private func whenTheViewLoads() {
        mainSceneViewController.loadViewIfNeeded()
    }
}
