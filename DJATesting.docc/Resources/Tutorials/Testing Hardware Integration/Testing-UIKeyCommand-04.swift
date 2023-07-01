import XCTest
import DJATesting
@testable import MyApp

final class ItemListViewControllerTests: XCTestCase {
    private var itemListViewController: ItemListViewController!
    
    override func tearDown() {
        itemListViewController = nil
        super.tearDown()
    }
    
    private func givenAnItemListViewController() {
        itemListViewController = ItemListViewController()
    }
}