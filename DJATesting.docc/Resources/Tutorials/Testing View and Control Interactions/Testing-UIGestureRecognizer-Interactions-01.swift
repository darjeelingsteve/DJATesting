import UIKit

final class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(indicateDanger(_:))))
    }

    @objc private func indicateDanger(_ sender: Any) {
        view.backgroundColor = .systemRed
    }
}
