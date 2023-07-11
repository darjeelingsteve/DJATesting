import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    private var parentViewController: PresentationCapturingViewController<UIAlertController>!
    
    override func setUp() {
        super.setUp()
        parentViewController = PresentationCapturingViewController<UIAlertController>()
    }
    
    override func tearDown() {
        myViewController = nil
        parentViewController = nil
        super.tearDown()
    }
    
    func testItShowsAnAlertWhenHandlingAnError() {
        let error = NSError(domain: "MyApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Logout failed"])

        givenAViewController()
        whenTheViewLoads()
        whenTheUserPerformsAnActionThatTriggersAnError(error)
        XCTAssertEqual(parentViewController.receivedViewControllerForPresentation?.title, "Error")
        XCTAssertEqual(parentViewController.receivedViewControllerForPresentation?.message, "Logout failed")
        XCTAssertEqual(parentViewController.receivedViewControllerForPresentation?.actions.count, 1)
        XCTAssertEqual(parentViewController.receivedViewControllerForPresentation?.actions[0].title, "OK")
        XCTAssertEqual(parentViewController.receivedViewControllerForPresentation?.actions[0].style.rawValue, UIAlertActionStyle.default.rawValue)
    }
    
    private func givenAViewController() {
        myViewController = MyViewController()
        parentViewController.addChild(myViewController)
        myViewController.didMove(toParent: parentViewController)
    }
    
    private func whenTheViewLoads() {
        myViewController.loadViewIfNeeded()
    }
    
    private func whenTheUserPerformsAnActionThatTriggersAnError(_ error: Error = NSError(domain: "", code: 0) {
        // Simulate an action that presents an alert.
    }
}
