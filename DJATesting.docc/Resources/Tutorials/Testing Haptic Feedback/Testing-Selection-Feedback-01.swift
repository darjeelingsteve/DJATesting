import UIKit

final class OptionView: UIView {
    private let selectionFeedbackGenerator: UISelectionFeedbackGenerator
    
    init(selectionFeedbackGenerator: UISelectionFeedbackGenerator) {
        self.selectionFeedbackGenerator = selectionFeedbackGenerator
        super.init(frame: .zero)
    }
}