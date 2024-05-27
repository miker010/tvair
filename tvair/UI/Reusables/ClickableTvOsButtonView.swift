import Foundation
import SwiftUI

class ClickableTvOsButtonView: UIView {
    weak var delegate: ClickableTvOsButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if validatePress(event: event) {
            delegate?.pressStart()
        } else {
            super.pressesBegan(presses, with: event)
        }
    }

    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if validatePress(event: event) {
            delegate?.pressEnd()
        } else {
            super.pressesEnded(presses, with: event)
        }
    }
    
    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if validatePress(event: event) {
            delegate?.pressEnd()
        } else {
            super.pressesCancelled(presses, with: event)
        }
    }
    
    private func validatePress(event: UIPressesEvent?) -> Bool {
        event?.allPresses.map({ $0.type }).contains(.select) ?? false
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        delegate?.focus(focused: isFocused)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var canBecomeFocused: Bool {
        return true
    }
}
