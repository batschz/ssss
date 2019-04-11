import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let controller = SomeController()
    router.get("/", use: controller.hello)
    router.get("memory", use: controller.memory)
    router.get("crash", use: controller.crash)
}
