import UIKit

final class MyViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.accessibilityIdentifier = "collection_view"
        return collectionView
    }

    private(set) var deletedIndexPath: IndexPath?
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.trailingSwipeActionsConfigurationProvider = { indexPath in
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { [weak self] _, _, _ in
                self?.deletedIndexPath = indexPath
            })
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
