
extension Deque {
    
    @usableFromInline
    internal class _Buffer: ManagedBuffer<_Header, Element> {
        
        @inlinable
        deinit {}
    }
}

extension Deque._Buffer {
    
    @inlinable
    internal static func create(minimumCapacity: Int) -> Deque._Buffer {
        let buffer = Deque._Buffer.create(minimumCapacity: minimumCapacity) { buffer in
            return Deque._Header(capacity: buffer.capacity)
        }
        return unsafeDowncast(buffer, to: Deque._Buffer.self)
    }
}
