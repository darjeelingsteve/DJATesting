import UIKit

final class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let dangerButton = UIButton(primaryAction: UIAction(title: "Danger!") { [weak self] _ in
            self?.view.backgroundColor = .systemRed
        })
        dangerButton.accessibilityIdentifier = "danger_button"
        view.addSubview(dangerButton)
        /// Layout constraint configuration omitted for brevity
    }
}
