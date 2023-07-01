import UIKit

final class ItemListViewController: UIViewController {
    weak var delegate: ItemListViewControllerDelegate?
    
    @objc func createNewItem(_ sender: Any) {
        delegate?.itemListViewControllerRequestingNewItemCreation(self)
    }
}

protocol ItemListViewControllerDelegate: AnyObject {
    func itemListViewControllerRequestingNewItemCreation(_ itemListViewController: ItemListViewController)
}
