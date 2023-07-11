import UIKit

final class MyViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            return .list(using: configuration, layoutEnvironment: layoutEnvironment)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.accessibilityIdentifier = "collection_view"
        return collectionView
    }()
}
