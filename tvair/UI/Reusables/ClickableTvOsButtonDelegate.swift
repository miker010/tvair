import Foundation
import SwiftUI

protocol ClickableTvOsButtonDelegate: AnyObject {
    func focus(focused: Bool)
    func pressStart()
    func pressEnd()
}
