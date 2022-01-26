import XCTest
@testable import MyApp

final class UserListDataSourceTests: XCTest {
    private var userListDataSource: UserListDataSource!
    private var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func tearDown() {
        userListDataSource = nil
        collectionView = nil
        super.tearDown()
    }
    
    func testItCreatesASnapshotUsingTheGivenUsers() {
        givenAUserListDataSource()
        whenUsersAreAssignedToTheDataSource()
        XCTAssertEqual(userListDataSource.snapshot().sectionIdentifiers, [.users])
        XCTAssertEqual(userListDataSource.snapshot().numberOfItems(inSection: .users), 2)
    }
    
    private func givenAUserListDataSource() {
        userListDataSource = UserListDataSource(collectionView: collectionView, cellProvider: { _, _, _ -> UICollectionViewCell? in
            return nil
        })
    }
    
    private func whenUsersAreAssignedToTheDataSource() {
        let users = try! [User].from(fileName: "DummyUsers", inBundle: Bundle(for: UserListDataSourceTests.self))
        userListDataSource.users = users
    }
}
