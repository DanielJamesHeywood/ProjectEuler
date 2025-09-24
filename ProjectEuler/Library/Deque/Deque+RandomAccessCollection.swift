
extension Deque: RandomAccessCollection {
    
    public typealias Index = Int
    
    @inlinable
    public subscript(position: Int) -> Element {
        return _buffer.withUnsafeMutablePointers { pointerToHeader, pointerToElements in
            let header = pointerToHeader.pointee
            return pointerToElements[(header.startIndex + position) % header.capacity]
        }
    }
    
    @inlinable
    public var startIndex: Int {
        return 0
    }
    
    @inlinable
    public var endIndex: Int {
        return _buffer.withUnsafeMutablePointerToHeader { pointer in
            return pointer.pointee.count
        }
    }
    
    @inlinable
    public func index(before index: Int) -> Int {
        return index - 1
    }
    
    @inlinable
    public func index(after index: Int) -> Int {
        return index + 1
    }
}
