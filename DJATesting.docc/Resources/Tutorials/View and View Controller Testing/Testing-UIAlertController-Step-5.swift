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
    
    private func givenAViewController() {
        myViewController = MyViewController()
        parentViewController.addChild(myViewController)
        myViewController.didMove(toParent: parentViewController)
    }
}
