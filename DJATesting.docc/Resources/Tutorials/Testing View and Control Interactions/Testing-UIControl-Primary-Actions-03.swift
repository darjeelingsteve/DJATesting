import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    
    override func tearDown() {
        myViewController = nil
        super.tearDown()
    }

    private func givenAViewController() {
        myViewController = MyViewController()
    }

    private func whenTheUserTapsTheDangerButton() {
        myViewController.dangerButton.simulatePrimaryActionTriggered()
    }
}

private extension MyViewController {
    var dangerButton: UIButton {
        view.subview(ofType: UIButton.self, withAccessibilityIdentifier: "danger_button")!
    }
}
