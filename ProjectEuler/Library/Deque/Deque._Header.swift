
extension Deque {
    
    @usableFromInline
    internal struct _Header {
        
        @usableFromInline
        internal let capacity: Int
        
        @usableFromInline
        internal var _startIndex: Int
        
        @usableFromInline
        internal var _endIndex: Int
        
        @inlinable
        internal init(capacity: Int) {
            precondition(capacity >= 0)
            self.capacity = capacity
            self._startIndex = 0
            self._endIndex = 0
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
                return _endIndex
            }
        }
    }
}
