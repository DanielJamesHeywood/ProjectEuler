
extension Deque {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal var _offset = 0
        
        @usableFromInline
        internal var _count = 0
        
        @usableFromInline
        internal var _capacity: Int
        
        @usableFromInline
        internal var _pointerToElements: UnsafeMutablePointer<Element>
        
        @inlinable
        internal init(minimumCapacity: Int) {
            let capacity = max(minimumCapacity, 0)
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

extension Deque._Storage {
    
    @inlinable
    internal subscript(position: Int) -> Element { _unsafeMutablePointerToElement(at: position).pointee }
    
    @inlinable
    internal var count: Int { _count }
}

extension Deque._Storage {
    
    @inlinable
    internal func _unsafeMutablePointerToElement(at i: Int) -> UnsafeMutablePointer<Element> {
        precondition(i >= 0 && i < _count)
        return _pointerToElements + (_offset + i) % _capacity
    }
}
