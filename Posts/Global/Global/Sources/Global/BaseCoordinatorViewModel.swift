import SwiftUI
import Combine

@Observable open class BaseCoordinatorViewModel<Screen: Sendable> {

    // MARK: - Public properties

    public var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    public init() {}
}
