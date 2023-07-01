import UIKit

final class ItemListViewController: UIViewController {
    weak var delegate: ItemListViewControllerDelegate?
}

protocol ItemListViewControllerDelegate: AnyObject {
    func itemListViewControllerRequestingNewItemCreation(_ itemListViewController: ItemListViewController)
}
