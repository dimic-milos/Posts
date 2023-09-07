import SwiftUI
import FlowStacks

@Observable open class BaseCoordinatorViewModel<Screen: Sendable> {

    // MARK: - Public properties

    public var routes: Routes<Screen> = []

    // MARK: - Init

    public init() {}
}
