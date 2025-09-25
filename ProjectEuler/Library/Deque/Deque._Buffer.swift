
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
                if header.startIndex + header.count <= header.capacity {
                    pointerToElements.advanced(by: header.startIndex).deinitialize(count: header.count)
                } else {
                    let count = header.capacity - header.startIndex
                    pointerToElements.advanced(by: header.startIndex).deinitialize(count: count)
                    pointerToElements.deinitialize(count: header.count - count)
                }
            }
        }
    }
}
