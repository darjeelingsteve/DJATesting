import XCTest
import DJATesting
@testable import MyApp

final class BorderedTextViewTests: XCTestCase {
    private var borderedTextView: BorderedTextView!
    
    override func tearDown() {
        borderedTextView = nil
        super.tearDown()
    }
}

private extension BorderedTextView {
    var label: UILabel {
        subview(ofType: UILabel.self, withAccessibilityIdentifier: "label")!
    }
}
