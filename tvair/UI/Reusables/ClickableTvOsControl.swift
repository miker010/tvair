import Foundation
import SwiftUI

struct ClickableTvOsControl: UIViewRepresentable {
    @Binding var focused: Bool
    @Binding var pressed: Bool
    let action: () -> Void
    
    func makeUIView(context: UIViewRepresentableContext<ClickableTvOsControl>) -> UIView {
        let clickableView = ClickableTvOsButtonView()
        clickableView.delegate = context.coordinator
        return clickableView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ClickableTvOsControl>) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, ClickableTvOsButtonDelegate {
        private let control: ClickableTvOsControl
        
        init(_ control: ClickableTvOsControl) {
            self.control = control
            super.init()
        }
        
        func focus(focused: Bool) {
            control.focused = focused
        }
        
        func pressStart() {
            control.pressed = true
        }
        
        func pressEnd() {
            control.pressed = false
            control.action()
        }
    }
}
