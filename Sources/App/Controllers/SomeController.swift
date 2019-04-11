import Vapor

final class SomeController {
    
    let serverId = UUID.init().uuidString
    
    func crash(_ req: Request) throws -> String {
        exit(0)
        return "you will never see this message \(serverId)"
    }

    func hello(_ req: Request) throws -> String {
        return "It works! \(serverId)"
    }
    
    func memory(_ req: Request) throws -> String {
        let mb = 1048576
        _ = [UInt8](repeating: 0, count: 1000 * mb)
        return "Memory allocated on Server \(serverId)"
    }

}
