import XCTest
import DJATesting
@testable import MyApp

final class BorderedImageViewTests: XCTestCase {
    private var borderedImageView: BorderedImageView!
    
    override func tearDown() {
        borderedImageView = nil
        super.tearDown()
    }
    
    func testItDrawsTheImageInItsImageView() {
        let image = UIImage.image(ofColour: .red, size: CGSize(width: 20, height: 20))
        givenABorderedImageView()
        whenTheImage(isSetTo: image)
        XCTAssertEqual(borderedImageView.imageView.image, image)
    }
    
    private func givenABorderedImageView() {
        borderedImageView = BorderedImageView()
    }
    
    private func whenTheImage(isSetTo image: UIImage) {
        borderedImageView.image = image
    }
}

private extension BorderedImageView {
    var imageView: UIImageView {
        subview(ofType: UIImageView.self, withAccessibilityIdentifier: "image_view")!
    }
}