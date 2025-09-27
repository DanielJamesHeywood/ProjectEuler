
extension Deque: Equatable where Element: Equatable {
    
    @inlinable
    public static func == (lhs: Deque, rhs: Deque) -> Bool {
        guard lhs._buffer !== rhs._buffer else {
            return true
        }
        guard lhs.count == rhs.count else {
            return false
        }
        return lhs.elementsEqual(rhs)
    }
}
