import UIKit

final class OptionView: UIView {
    private(set) lazy var yesButton = UIButton(type: .system, primaryAction: UIAction(title: "Yes") { [weak self] _ in
        self?.selectionFeedbackGenerator.selectionChanged()
    })
    
    private(set) lazy var noButton = UIButton(type: .system, primaryAction: UIAction(title: "No") { [weak self] _ in
        self?.selectionFeedbackGenerator.selectionChanged()
    })
    
    private let selectionFeedbackGenerator: UISelectionFeedbackGenerator
    
    init(selectionFeedbackGenerator: UISelectionFeedbackGenerator) {
        self.selectionFeedbackGenerator = selectionFeedbackGenerator
        super.init(frame: .zero)
    }
}