import UIKit

final class MyViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            configuration.itemSeparatorHandler = { indexPath, _ in
                var separatorConfiguration = UIListSeparatorConfiguration(listAppearance: .insetGrouped)
                separatorConfiguration.topSeparatorVisibility = indexPath.item == 0 ? .hidden : .visible
                separatorConfiguration.bottomSeparatorVisibility = .hidden
                return separatorConfiguration
            }
            return .list(using: configuration, layoutEnvironment: layoutEnvironment)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.accessibilityIdentifier = "collection_view"
        return collectionView
    }()
}
