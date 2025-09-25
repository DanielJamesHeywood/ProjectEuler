
extension Deque {
    
    @usableFromInline
    internal class _Buffer: ManagedBuffer<_Header, Element> {
        
        @inlinable
        internal static func create(minimumCapacity: Int) -> _Buffer {
            let buffer = _Buffer.create(minimumCapacity: minimumCapacity) { buffer in
                return _Header(capacity: buffer.capacity)
            }
            return unsafeDowncast(buffer, to: _Buffer.self)
        }
        
        @inlinable
        deinit {}
    }
}
