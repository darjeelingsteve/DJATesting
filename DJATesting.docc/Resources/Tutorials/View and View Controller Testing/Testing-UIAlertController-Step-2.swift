import UIKit

final class MyViewController: UIViewController {
    private func handleError(_ error: Error) {
        view.backgroundColor = .red
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.view.backgroundColor = .systemBackground
        })
    }
}
