
extension Deque {
    
    @frozen
    public struct Iterator {
        
        @usableFromInline
        internal let _baseStorage: _Storage
        
        @usableFromInline
        internal var _nextIndex: Int
        
        @usableFromInline
        internal let _endIndex: Int
        
        @inlinable
        internal init(_base: Deque) {
            _baseStorage = _base._storage
            _nextIndex = _base.startIndex
            _endIndex = _base.endIndex
        }
    }
}
