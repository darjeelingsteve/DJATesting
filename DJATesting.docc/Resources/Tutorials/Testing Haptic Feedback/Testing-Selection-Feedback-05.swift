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
    
    func testItTriggersFeedbackWhenTheUserTapsTheYesButton() {
        givenAnOptionView()
        whenTheUserTapsTheYesButton()
        XCTAssertTrue(mockSelectionFeedbackGenerator.receivedSelectionChangedMessage)
    }
    
    func testItTriggersFeedbackWhenTheUserTapsTheNoButton() {
        givenAnOptionView()
        whenTheUserTapsTheNoButton()
        XCTAssertTrue(mockSelectionFeedbackGenerator.receivedSelectionChangedMessage)
    }
    
    private func givenAnOptionView() {
        optionView = OptionView(selectionFeedbackGenerator: mockSelectionFeedbackGenerator)
    }
    
    private func whenTheUserTapsTheYesButton() {
        optionView.yesButton.simulatePrimaryActionTriggered()
    }
    
    private func whenTheUserTapsTheNoButton() {
        optionView.noButton.simulatePrimaryActionTriggered()
    }
}