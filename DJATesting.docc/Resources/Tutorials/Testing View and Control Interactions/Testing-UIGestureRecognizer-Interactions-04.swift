import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    
    override func tearDown() {
        myViewController = nil
        super.tearDown()
    }

    func testItChangesTheBackgroundColourWhenTheUserTapsTheDangerButton() {
        givenAViewController()
        whenTheUserTapsTheView()
        XCTAssertEqual(myViewController.view.backgroundColor, .systemRed)
    }

    private func givenAViewController() {
        myViewController = MyViewController()
    }

    private func whenTheUserTapsTheView() {
        myViewController.view.gestureRecognizers[0].dja_simulateGestureRecognition()
    }
}
