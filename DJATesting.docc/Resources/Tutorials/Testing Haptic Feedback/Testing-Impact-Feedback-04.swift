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
    
    private func givenAViewController() {
        myViewController = MyViewController(impactFeedbackGenerator: mockImpactFeedbackGenerator)
    }
}
