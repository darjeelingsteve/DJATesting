import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    
    override func tearDown() {
        myViewController = nil
        super.tearDown()
    }

    func testItUsesTheCorrectBarButtonSystemItem() {
        givenAViewController()
        XCTAssertEqual(myViewController.saveBarButtonItem.systemItem, .save)
    }

    func testItHandlesWhenTheUserTapsTheSaveBarButtonItem() {
        givenAViewController()
        whenTheUserTapsTheSaveBarButtonItem()
        /// Write assertions to test bar button tap response
    }

    private func givenAViewController() {
        myViewController = MyViewController()
    }

    private func whenTheUserTapsTheSaveBarButtonItem() {
        myViewController.saveBarButtonItem.simulateTap()
    }
}

private extension MyViewController {
    var saveBarButtonItem: UIBarButtonItem {
        navigationItem.rightBarButtonItem!
    }
}
