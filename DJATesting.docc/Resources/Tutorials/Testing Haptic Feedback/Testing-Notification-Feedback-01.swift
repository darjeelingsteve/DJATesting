import UIKit

final class NotificationDisplayController {
    private let contentViewController: UIViewController
    private let notificationFeedbackGenerator: UINotificationFeedbackGenerator
    
    init(contentViewController: UIViewController, notificationFeedbackGenerator: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()) {
        self.contentViewController = contentViewController
        self.notificationFeedbackGenerator = notificationFeedbackGenerator
    }
}