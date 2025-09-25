
public struct Deque<Element> {
    
    @usableFromInline
    internal var _buffer: _Buffer
    
    @inlinable
    public init(minimumCapacity: Int) {
        self._buffer = .create(minimumCapacity: minimumCapacity)
    }
}
