import XCTest
import DJATesting
@testable import MyApp

final class OptionViewTests: XCTestCase {
    private var optionView: OptionView!
    private var mockSelectionFeedbackGenerator: MockSelectionFeedbackGenerator!
    
    override func setUp() {
        super.setUp()
        mockSelectionFeedbackGenerator = MockSelectionFeedbackGenerator()
    }
    
    override func tearDown() {
        optionView = nil
        mockSelectionFeedbackGenerator = nil
        super.tearDown()
    }
    
    private func givenAnOptionView() {
        optionView = OptionView(selectionFeedbackGenerator: mockSelectionFeedbackGenerator)
    }
}