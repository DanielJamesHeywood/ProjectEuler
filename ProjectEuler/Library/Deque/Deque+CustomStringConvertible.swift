
extension Deque: CustomStringConvertible {
    
    @inlinable
    public var description: String {
        let elementDescriptions = map { element in
            return String(reflecting: element)
        }
        return "[\(elementDescriptions.joined(separator: ", "))]"
    }
}
