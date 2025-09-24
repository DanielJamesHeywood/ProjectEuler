
extension Deque {
    
    @usableFromInline
    internal struct _Header {
        
        @usableFromInline
        internal let capacity: Int
        
        @usableFromInline
        internal var _startIndex: Int
        
        @usableFromInline
        internal var _count: Int
        
        @inlinable
        internal init(capacity: Int) {
            precondition(capacity >= 0)
            self.capacity = capacity
            self._startIndex = 0
            self._count = 0
        }
        
        @inlinable
        internal var startIndex: Int {
            get {
                return _startIndex
            }
        }
        
        @inlinable
        internal var endIndex: Int {
            get {
                return (_startIndex + _count) % capacity
            }
        }
        
        @inlinable
        internal var count: Int {
            get {
                return _count
            }
        }
    }
}
