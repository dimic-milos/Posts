import Resolver

public enum PostModule {

    public static func registerDependencies() {
        Resolver.registerCoordinators()
        Resolver.registerServices()
        Resolver.registerManagers()
    }
}
