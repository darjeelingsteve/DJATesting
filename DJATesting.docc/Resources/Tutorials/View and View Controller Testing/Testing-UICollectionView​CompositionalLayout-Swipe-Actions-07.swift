import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    
    override func tearDown() {
        myViewController = nil
        super.tearDown()
    }

    private func givenAViewController() {
        myViewController = MyViewController()
    }

    func testItDisplaysADeleteSwipeAction() {
        givenAViewController()
        whenTheViewLoads()
        let swipeActions = swipeActions(forItemAtIndexPath: IndexPath(item: 0, section: 0))
        XCTAssertEqual(swipeActions.count, 1)
        XCTAssertEqual(swipeActions[0].title, "Delete")
        XCTAssertEqual(swipeActions[0].style, .destructive)
    }

    private func whenTheViewLoads() {
        myViewController.loadViewIfNeeded()
    }

    private func swipeActions(forItemAtIndexPath indexPath: IndexPath) -> [UIContextualAction] {
        let layoutSection = myViewController.collectionViewCompositionalLayout.section(atIndex: indexPath.section)!
        guard let swipeActionsConfigurations = layoutSection.trailingSwipeActionsConfiguration(atIndexPath: indexPath) else {
            fail("Failed to get swipe action configurations")
            return
        }
        return swipeActionsConfigurations.actions
    }
}

private extension MyViewController {
    var collectionView: UICollectionView {
        view.subview(ofType: UICollectionView.self, withAccessibilityIdentifier: "collection_view")!
    }

    var collectionViewCompositionalLayout: UICollectionViewCompositionalLayout {
        collectionView.collectionViewLayout as! UICollectionViewCompositionalLayout
    }
}

