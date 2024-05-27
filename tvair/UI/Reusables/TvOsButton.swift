import Foundation
import SwiftUI

struct TvOsButton<Content>: View where Content : View {
    @State
    private var focused = false
    @State
    private var pressed = false
    
    let action: () -> Void
    @ViewBuilder
    let content: () -> Content
    
    var body: some View {
        contentView
            .background(focused ? Color.green : .yellow)
            .cornerRadius(20)
            .scaleEffect(pressed ? 1.1 : 1)
            .animation(.default, value: pressed)
    }
    
    var contentView: some View {
#if os(tvOS)
        ZStack {
            ClickableTvOsControl(focused: $focused, pressed: $pressed, action: action)
            content()
                .padding()
                .layoutPriority(1)
        }
#else
        Button(action: action, label: content)
#endif
    }
}
