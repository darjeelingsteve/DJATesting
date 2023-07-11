import XCTest
import DJATesting
@testable import MyApp

final class BorderedImageViewTests: XCTestCase {
    private var borderedImageView: BorderedImageView!
    
    override func tearDown() {
        borderedImageView = nil
        super.tearDown()
    }
    
    private func givenABorderedImageView() {
        borderedImageView = BorderedImageView()
    }
}

private extension BorderedImageView {
    var imageView: UIImageView {
        subview(ofType: UIImageView.self, withAccessibilityIdentifier: "image_view")!
    }
}