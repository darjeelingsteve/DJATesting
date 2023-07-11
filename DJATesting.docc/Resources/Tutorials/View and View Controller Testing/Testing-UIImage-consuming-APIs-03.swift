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