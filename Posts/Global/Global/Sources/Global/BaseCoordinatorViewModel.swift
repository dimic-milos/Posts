import SwiftUI
import Combine
import FlowStacks

@Observable open class BaseCoordinatorViewModel<Screen: Sendable> {

    // MARK: - Public properties

    public var routes: Routes<Screen> = []

    public var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    public init() {}
}
