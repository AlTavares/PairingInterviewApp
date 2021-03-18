import UIKit

final class TapGestureRecognizer: UITapGestureRecognizer {
    private var action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(executeAction))
    }

    @objc private func executeAction() {
        action()
    }
}
