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
    
    func testItSetsTheTitleCorrectlyInRegularWidthEnvironments() {
        givenAViewController()
        whenTheViewIsLaidOut(inHorizontalSizeClass: .regular)
        XCTAssertEqual(userViewController.title, "Gregg")
    }
    
    func testItSetsTheTitleCorrectlyInCompactWidthEnvironments() {
        givenAViewController()
        whenTheViewIsLaidOut(inHorizontalSizeClass: .compact)
        XCTAssertNil(userViewController.title)
    }

    private func givenAViewController() {
        let users = try! [User].from(fileName: "DummyUsers", inBundle: Bundle(for: UserViewControllerTests.self))
        userViewController = UserViewController(user: users[0])
    }
    
    private func whenTheViewIsLaidOut(inHorizontalSizeClass horizontalSizeClass: UIUserInterfaceSizeClass) {
        traitCollectionOverridingViewController = TraitCollectionOverridingViewController(overridenTraits: UITraitCollection(horizontalSizeClass: horizontalSizeClass),
                                                                                          forViewController: userViewController)
        userViewController.viewDidLayoutSubviews()
    }
}
