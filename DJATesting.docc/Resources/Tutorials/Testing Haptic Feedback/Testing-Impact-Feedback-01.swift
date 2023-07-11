import UIKit

final class MyViewController: UIViewController {
    private let impactFeedbackGenerator: UIImpactFeedbackGenerator
    
    init(impactFeedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator()) {
        self.impactFeedbackGenerator = impactFeedbackGenerator
        super.init(nibName: nil, bundle: nil)
    }
}
