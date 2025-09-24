
extension Deque {
    
    @usableFromInline
    internal class _Buffer: ManagedBuffer<_Header, Element> {
        
        @inlinable
        internal var count: Int {
            get {
                return withUnsafeMutablePointerToHeader { pointer in
                    return pointer.pointee.count
                }
            }
        }
    }
}
