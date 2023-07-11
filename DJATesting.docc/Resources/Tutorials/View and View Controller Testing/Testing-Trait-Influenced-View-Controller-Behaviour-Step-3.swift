import XCTest
import DJATesting
@testable import MyApp

final class UserViewControllerTests: XCTestCase {
    private var userViewController: UserViewController!
    private var traitCollectionOverridingViewController: TraitCollectionOverridingViewController!
    
    override func tearDown() {
        userViewController = nil
        traitCollectionOverridingViewController = nil
        super.tearDown()
    }
}
