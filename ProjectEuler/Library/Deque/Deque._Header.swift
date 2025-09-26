
extension Deque {
    
    @usableFromInline
    internal struct _Header {
        
        @usableFromInline
        internal let capacity: Int
        
        @usableFromInline
        internal var _offset = 0
        
        @usableFromInline
        internal var _count = 0
        
        @inlinable
        internal init(capacity: Int) {
            precondition(capacity >= 1)
            self.capacity = capacity
        }
        
        @inlinable
        internal var offset: Int {
            get {
                return _offset
            }
            set(newOffset) {
                precondition(0..<capacity ~= newOffset)
                _offset = newOffset
            }
        }
        
        @inlinable
        internal var count: Int {
            get {
                return _count
            }
            set(newCount) {
                precondition(0...capacity ~= newCount)
                _count = newCount
            }
        }
    }
}
