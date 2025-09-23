
extension Deque {
    
    @usableFromInline
    internal struct _Header {
        
        @usableFromInline
        internal let capacity: Int
        
        @usableFromInline
        internal let startIndex: Int
        
        @usableFromInline
        internal let endIndex: Int
        
        @inlinable
        internal init(capacity: Int) {
            precondition(capacity >= 0)
            self.capacity = capacity
            self.startIndex = 0
            self.endIndex = 0
        }
    }
}
