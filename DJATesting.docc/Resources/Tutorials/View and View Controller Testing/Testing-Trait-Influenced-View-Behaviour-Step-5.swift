import XCTest
import DJATesting
@testable import MyApp

final class BorderedTextViewTests: XCTestCase {
    private var borderedTextView: BorderedTextView!
    
    override func tearDown() {
        borderedTextView = nil
        super.tearDown()
    }

    private func givenAView(withText text: String) {
        borderedTextView = BorderedTextView()
        borderedTextView.translatesAutoresizingMaskIntoConstraints = false
        borderedTextView.text = text
    }
    
    private func whenTheViewLaysOut() {
        borderedTextView.layoutIfNeeded()
    }
}

private extension BorderedTextView {
    var label: UILabel {
        subview(ofType: UILabel.self, withAccessibilityIdentifier: "label")!
    }
}
