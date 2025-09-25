
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
        deinit {
            withUnsafeMutablePointers { pointerToHeader, pointerToElements in
                let header = pointerToHeader.pointee
                let capacity = header.capacity
                let offset = header.offset
                let count = header.count
                if offset + count <= capacity {
                    pointerToElements.advanced(by: offset).deinitialize(count: count)
                } else {
                    let aCount = capacity - offset
                    pointerToElements.advanced(by: offset).deinitialize(count: aCount)
                    pointerToElements.deinitialize(count: count - aCount)
                }
            }
        }
    }
}
