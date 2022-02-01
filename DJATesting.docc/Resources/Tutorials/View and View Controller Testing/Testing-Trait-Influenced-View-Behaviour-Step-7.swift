import XCTest
import DJATesting
@testable import MyApp

final class BorderedTextViewTests: XCTestCase {
    private var borderedTextView: BorderedTextView!
    private var traitCollectionOverridingViewController: TraitCollectionOverridingViewController!
    
    override func tearDown() {
        borderedTextView = nil
        traitCollectionOverridingViewController = nil
        super.tearDown()
    }
    
    func testItLaysOutTheLabelCorrectly() {
        givenAView(withText: "Hello")
        whenTheViewLaysOut()
        XCTAssertEqual(borderedTextView.label.frame.origin.x, borderedTextView.directionalLayoutMargins.leading)
        XCTAssertEqual(borderedTextView.label.frame.origin.y, borderedTextView.directionalLayoutMargins.top)
        XCTAssertEqual(borderedTextView.label.frame.width, borderedTextView.bounds.width - borderedTextView.directionalLayoutMargins.leading - borderedTextView.directionalLayoutMargins.trailing)
        XCTAssertEqual(borderedTextView.label.frame.height, borderedTextView.bounds.height - borderedTextView.directionalLayoutMargins.top - borderedTextView.directionalLayoutMargins.bottom)
    }

    private func givenAView(withText text: String) {
        borderedTextView = BorderedTextView()
        borderedTextView.translatesAutoresizingMaskIntoConstraints = false
        borderedTextView.text = text
        traitCollectionOverridingViewController = TraitCollectionOverridingViewController(overridenTraits: UITraitCollection(displayScale: 2.0),
                                                                                          forView: borderedTextView)
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
