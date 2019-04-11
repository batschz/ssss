import Vapor

final class SomeController {
    
    let serverId = UUID.init().uuidString
    
    func crash(_ req: Request) throws -> String {
        guard Int.random(in: 0 ..< 3) > 0 else {
            fatalError("argh")
        }
        return "💩, \(serverId)"
    }

    func hello(_ req: Request) throws -> String {
        return "🍺, \(serverId)"
    }
    
    func memory(_ req: Request) throws -> String {
        let mb = 1048576
        _ = [UInt8](repeating: 0, count: 1000 * mb)
        return "👨🏻‍💻 \(serverId)"
    }

}
