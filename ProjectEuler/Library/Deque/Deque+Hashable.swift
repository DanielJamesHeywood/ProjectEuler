
extension Deque: Hashable where Element: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        for element in self {
            hasher.combine(element)
        }
    }
}
