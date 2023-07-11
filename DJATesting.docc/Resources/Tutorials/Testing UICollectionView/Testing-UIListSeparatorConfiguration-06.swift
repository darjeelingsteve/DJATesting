import XCTest
import DJATesting
@testable import MyApp

final class MyViewControllerTests: XCTest {
    private var myViewController: MyViewController!
    
    override func tearDown() {
        myViewController = nil
        super.tearDown()
    }

    func testItUsesTheCorrectSeparatorConfiguration() {
        givenAViewController()
        whenTheViewLaysOut()
        let firstSection = myViewController.collectionViewCompositionalLayout.section(atIndex: 0)
        let firstCellListSeparatorConfiguration = firstSection?.listSeparatorConfigurationForItem(atIndexPath: IndexPath(item: 0, section: 0))
        let secondCellListSeparatorConfiguration = firstSection?.listSeparatorConfigurationForItem(atIndexPath: IndexPath(item: 1, section: 0))
        XCTAssertEqual(firstCellListSeparatorConfiguration?.topSeparatorVisibility, .hidden)
        XCTAssertEqual(firstCellListSeparatorConfiguration?.bottomSeparatorVisibility, .hidden)
        XCTAssertEqual(secondCellListSeparatorConfiguration?.topSeparatorVisibility, .visible)
        XCTAssertEqual(secondCellListSeparatorConfiguration?.bottomSeparatorVisibility, .hidden)
    }

    private func givenAViewController() {
        myViewController = MyViewController()
    }

    private func whenTheViewLaysOut() {
        myViewController.view.layoutIfNeeded()
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

