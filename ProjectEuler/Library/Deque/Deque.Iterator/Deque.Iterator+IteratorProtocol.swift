
extension Deque.Iterator: IteratorProtocol {
    
    /// Advances to the next element and returns it, or `nil` if no next
    /// element exists.
    ///
    /// - Returns: The next element in the deque, if a next element exists;
    ///   otherwise, `nil`.
    @inlinable
    public mutating func next() -> Element? {
        guard _nextIndex != _endIndex else {
            return nil
        }
        defer {
            _nextIndex += 1
        }
        return _baseStorage[_nextIndex]
    }
}
