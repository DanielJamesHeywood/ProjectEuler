
extension Deque {
    
    @frozen
    public struct Iterator {
        
        @usableFromInline
        internal let _baseStorage: _Storage
        
        @inlinable
        internal init(_base: Deque) {
            _baseStorage = _base._storage
        }
    }
}
