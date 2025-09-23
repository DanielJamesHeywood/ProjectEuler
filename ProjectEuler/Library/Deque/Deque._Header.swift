
extension Deque {
    
    @usableFromInline
    internal struct _Header {
        
        @usableFromInline
        internal let capacity: Int
        
        @usableFromInline
        internal let startIndex: Int
        
        @usableFromInline
        internal let endIndex: Int
    }
}
