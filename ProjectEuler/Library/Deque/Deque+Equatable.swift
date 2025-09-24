
extension Deque: Equatable where Element: Equatable {
    
    @inlinable
    public static func == (lhs: Deque, rhs: Deque) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }
        for (lhElement, rhElement) in zip(lhs, rhs) {
            guard lhElement == rhElement else {
                return false
            }
        }
        return true
    }
}
