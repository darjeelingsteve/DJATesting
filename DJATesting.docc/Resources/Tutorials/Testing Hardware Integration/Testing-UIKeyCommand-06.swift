import XCTest
import DJATesting
@testable import MyApp

final class ItemListViewControllerTests: XCTestCase {
    private var itemListViewController: ItemListViewController!
    private var mockDelegate: MockItemListViewControllerDelegate!
    
    override func setUp() {
        super.setUp()
        mockDelegate = MockItemListViewControllerDelegate()
    }
    
    override func tearDown() {
        itemListViewController = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    private func givenAnItemListViewController() {
        itemListViewController = ItemListViewController()
        itemListViewController.delegate = mockDelegate
    }
    
    private func whenTheUserInvokesTheNewItemKeyCommand() {
        UIKeyCommand.createNewItemCommand.simulateCommandInvocation(on: itemListViewController)
    }
}

private final class MockItemListViewControllerDelegate: ItemListViewControllerDelegate {
    private(set) var receivedNewItemCreationMessage = false
    
    func itemListViewControllerRequestingNewItemCreation(_ itemListViewController: ItemListViewController) {
        receivedNewItemCreationMessage = true
    }
}