import UIKit

final class MyViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.accessibilityIdentifier = "scroll_view"
        return scrollView
    }()
    
    private let impactFeedbackGenerator: UIImpactFeedbackGenerator
    
    init(impactFeedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator()) {
        self.impactFeedbackGenerator = impactFeedbackGenerator
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addAutoLayoutSubview(scrollView)
        /// Layout constraint configuration omitted for brevity
    }
}
