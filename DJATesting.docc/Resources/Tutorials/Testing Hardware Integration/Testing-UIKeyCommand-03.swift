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

extension UIKeyCommand {
    static let createNewItemCommand = UIKeyCommand(title: "Create New Item…", action: #selector(ItemListViewController.createNewItem(_:)), input: "n")
}