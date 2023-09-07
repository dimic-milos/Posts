import Resolver

public enum LoginModule {

    public static func registerDependencies() {
        Resolver.registerCoordinators()
        Resolver.registerServices()
        Resolver.registerManagers()
    }
}
