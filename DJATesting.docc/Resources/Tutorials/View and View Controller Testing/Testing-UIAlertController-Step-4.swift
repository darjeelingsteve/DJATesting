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
    
    func testItShowsAnAlertWhenTheUserPerformsAnAction() {
        givenAViewController()
        whenTheViewLoads()
        whenTheUserPerformsAnActionThatPresentsAnAlert()
        let alertController = mockNavigationController.receivedViewControllerForPresentation as? UIAlertController
        XCTAssertEqual(alertController?.title, "Error")
        XCTAssertEqual(alertController?.message, "You have made an error happen!")
    }
    
    func testItDismissesTheAlertWhenTheUserTapsTheOKAction() {
        givenAViewController()
        whenTheViewLoads()
        whenTheUserPerformsAnActionThatPresentsAnAlert()
        let alertController = mockNavigationController.receivedViewControllerForPresentation as? UIAlertController
        let okAction = alertController?.actions.first
        XCTAssertEqual(okAction?.title, "OK")
        okAction?.invokeHandler()
        XCTAssertTrue(mockNavigationController.receivedDismissViewControllerMessage)
    }
    
    private func givenAViewController() {
        myViewController = MyViewController(childNavigationController: mockNavigationController)
    }
    
    private func whenTheViewLoads() {
        myViewController.loadViewIfNeeded()
    }
    
    private func whenTheUserPerformsAnActionThatPresentsAnAlert() {
        // Simulate an action that presents an alert.
    }
}
