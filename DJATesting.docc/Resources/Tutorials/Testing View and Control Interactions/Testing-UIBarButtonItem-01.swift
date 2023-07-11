import UIKit

final class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(handleSaveTap(_:)))
    }

    @objc private func handleSaveTap(_ sender: Any) {
        /// Handle tap
    }
}
