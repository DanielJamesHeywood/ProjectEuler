
extension Deque: CustomStringConvertible {
    
    @inlinable
    public var description: String {
        let elementDescriptions = map { element in
            return String(reflecting: element)
        }
        return "[\(elementDescriptions.joined(separator: ", "))]"
    }
}

extension Deque: CustomDebugStringConvertible {
    
    @inlinable
    public var debugDescription: String {
        return "Deque(\(self))"
    }
}
