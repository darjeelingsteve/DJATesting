import UIKit

final class NotificationDisplayController {
    private let contentViewController: UIViewController
    private let notificationFeedbackGenerator: UINotificationFeedbackGenerator
    
    struct Notification {
        let message: String
        let style: Style
        
        enum Style {
            case info
            case error
        }
    }
    
    init(contentViewController: UIViewController, notificationFeedbackGenerator: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()) {
        self.contentViewController = contentViewController
        self.notificationFeedbackGenerator = notificationFeedbackGenerator
    }
}