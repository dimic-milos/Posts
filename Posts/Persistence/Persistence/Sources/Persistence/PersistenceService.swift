import Foundation
import SwiftData
import Models

public protocol PersistenceServiceProtocol {

    func save<T: PersistentModel>(model: T) async throws
    func delete<T: PersistentModel>(predicate: Predicate<T>) async throws
    func fetch<T: PersistentModel>(sort: SortDescriptor<T>) async throws -> [T]
}

actor PersistenceService {

    // MARK: - Private properties

    private let container: ModelContainer!

    // MARK: - Init

    init(userID: Int) {
        self.container = try! ModelContainer(
            for: PostDBModel.self,
            configurations: ModelConfiguration("\(userID)", cloudKitDatabase: .none)
        )
        print("MiDi 12.12.2016", #file, #line, #function, self.container.configurations.count)
    }
}

// MARK: - PersistenceServiceProtocol

extension PersistenceService: PersistenceServiceProtocol {

    public func save<T: PersistentModel>(model: T) throws {
        let context = ModelContext(self.container)
        context.insert(model)

        do {
            try context.save()
        } catch {
            throw error
        }
    }

    public func delete<T: PersistentModel>(predicate: Predicate<T>) throws {
        let context = ModelContext(self.container)
        let descriptor = FetchDescriptor<T>(predicate: predicate)

        do {
            let models: [T] = try context.fetch(descriptor)
            models.forEach {
                context.delete($0)
            }
            try context.save()
        } catch {
            throw error
        }
    }

    public func fetch<T: PersistentModel>(sort: SortDescriptor<T>) throws -> [T] {
        try ModelContext(self.container).fetch(FetchDescriptor<T>(sortBy: [sort]))
    }
}
