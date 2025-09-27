
extension Deque {
    
    @usableFromInline
    internal final class _Buffer: ManagedBuffer<_Header, Element> {
        
        @inlinable
        internal static func create(minimumCapacity: Int) -> _Buffer {
            precondition(minimumCapacity >= 0)
            guard minimumCapacity != 0 else {
                return .create(minimumCapacity: 1)
            }
            let buffer = _Buffer.create(minimumCapacity: minimumCapacity) { buffer in
                return _Header(capacity: buffer.capacity)
            }
            return unsafeDowncast(buffer, to: _Buffer.self)
        }
        
        @inlinable
        deinit {
            self.withUnsafeMutablePointers { pointerToHeader, pointerToElements in
                let header = pointerToHeader.pointee
                if header.offset + header.count <= header.capacity {
                    pointerToElements.advanced(by: header.offset).deinitialize(count: header.count)
                } else {
                    let tailCount = header.capacity - header.offset
                    pointerToElements.advanced(by: header.offset).deinitialize(count: tailCount)
                    pointerToElements.deinitialize(count: header.count - tailCount)
                }
            }
        }
    }
}
