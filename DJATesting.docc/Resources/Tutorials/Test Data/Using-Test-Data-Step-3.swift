import XCTest
@testable import MyApp

final class UserListDataSourceTests: XCTest {
    private var userListDataSource: UserListDataSource!
    private var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    private func givenAUserListDataSource() {
        userListDataSource = UserListDataSource(collectionView: collectionView, cellProvider: { _, _, _ -> UICollectionViewCell? in
            return nil
        })
    }
}
