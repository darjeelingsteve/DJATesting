import XCTest
@testable import MyApp

final class UserListDataSourceTests: XCTest {
    private var userListDataSource: UserListDataSource!
    private var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
}
