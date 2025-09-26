
extension Deque: CustomStringConvertible {
    
    @inlinable
    public var description: String { "[\(map({ element in String(reflecting: element) }).joined(separator: ", "))]" }
}

extension Deque: CustomDebugStringConvertible {
    
    @inlinable
    public var debugDescription: String { "Deque(\(self))" }
}
