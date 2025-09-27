
extension Deque: Encodable where Element: Encodable {
    
    @inlinable
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(contentsOf: self)
    }
}

extension Deque: Decodable where Element: Decodable {
    
    @inlinable
    public init(from decoder: any Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.init(minimumCapacity: container.count ?? 0)
        while !container.isAtEnd {
            self.append(try container.decode(Element.self))
        }
    }
}
