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

    private func givenAViewController() {
        myViewController = MyViewController()
    }
}

private extension MyViewController {
    var saveBarButtonItem: UIBarButtonItem {
        navigationItem.rightBarButtonItem!
    }
}
