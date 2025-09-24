
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
            precondition(capacity >= 1)
            self.capacity = capacity
            self._startIndex = 0
            self._count = 0
        }
        
        @inlinable
        internal var startIndex: Int {
            return _startIndex
        }
        
        @inlinable
        internal var endIndex: Int {
            return (_startIndex + _count) % capacity
        }
        
        @inlinable
        internal var count: Int {
            return _count
        }
    }
}

extension Deque._Header {
    
    @inlinable
    internal mutating func incrementStartIndex() {
        _startIndex = (_startIndex + 1) % capacity
        _count -= 1
        precondition(_count >= 0)
    }
    
    @inlinable
    internal mutating func decrementStartIndex() {
        _startIndex = (_startIndex + (capacity - 1)) % capacity
        _count += 1
        precondition(_count <= capacity)
    }
    
    @inlinable
    internal mutating func incrementEndIndex() {
        _count += 1
        precondition(_count <= capacity)
    }
    
    @inlinable
    internal mutating func decrementEndIndex() {
        _count -= 1
        precondition(_count >= 0)
    }
}
