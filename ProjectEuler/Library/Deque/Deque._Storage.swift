
extension Deque {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal var _capacity: Int
        
        @usableFromInline
        internal var _offset = 0
        
        @usableFromInline
        internal var _count = 0
        
        @usableFromInline
        internal var _pointerToElements: UnsafeMutablePointer<Element>
        
        @inlinable
        internal init(capacity: Int) {
            _capacity = capacity
            _pointerToElements = .allocate(capacity: capacity)
        }
        
        @inlinable
        deinit {
            if _offset + _count <= _capacity {
                _pointerToElements.advanced(by: _offset).deinitialize(count: _count)
            } else {
                let aCount = _capacity - _offset
                _pointerToElements.advanced(by: _offset).deinitialize(count: aCount)
                _pointerToElements.deinitialize(count: _count - aCount)
            }
            _pointerToElements.deallocate()
        }
    }
}
