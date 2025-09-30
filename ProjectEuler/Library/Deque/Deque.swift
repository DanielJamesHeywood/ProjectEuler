
@frozen
public struct Deque<Element> {
    
    @usableFromInline
    internal var _storage: _Storage
    
    /// Creates an empty deque with preallocated space for at least the specified number of elements.
    ///
    /// - Parameter minimumCapacity: The minimum number of elements that the newly created deque should be able to store without reallocating its storage.
    @inlinable
    public init(minimumCapacity: Int) {
        _storage = _Storage(minimumCapacity: minimumCapacity)
    }
}
