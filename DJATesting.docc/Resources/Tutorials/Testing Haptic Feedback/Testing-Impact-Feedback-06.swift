import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTestCase {
    private var myViewController: MyViewController!
    private var mockImpactFeedbackGenerator: MockImpactFeedbackGenerator!
    
    override func setUp() {
        super.setUp()
        mockImpactFeedbackGenerator = MockImpactFeedbackGenerator(style: .medium)
    }
    
    override func tearDown() {
        myViewController = nil
        mockImpactFeedbackGenerator = nil
        super.tearDown()
    }
    
    func testItGeneratesHapticFeedbackWhenScrollingToTheTop() {
        givenAViewController()
        whenTheScrollViewScrollsToTheTop()
        XCTAssertTrue(mockImpactFeedbackGenerator.receivedImpactOccuredMessage)
    }
    
    private func givenAViewController() {
        myViewController = MyViewController(impactFeedbackGenerator: mockImpactFeedbackGenerator)
    }
    
    private func whenTheScrollViewScrollsToTheTop() {
        myViewController.scrollView.delegate?.scrollViewDidScrollToTop?(myViewController.scrollView)
    }
}

private extension MyViewController {
    var scrollView: UIScrollView {
        view.subview(ofType: UIScrollView.self, withAccessibilityIdentifier: "scroll_view")!
    }
}
