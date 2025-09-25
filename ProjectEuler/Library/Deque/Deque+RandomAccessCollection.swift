
extension Deque: RandomAccessCollection {
    
    public typealias Index = Int
    
    @inlinable
    public subscript(position: Int) -> Element {
        return _buffer.withUnsafeMutablePointers { pointerToHeader, pointerToElements in
            let header = pointerToHeader.pointee
            precondition(0..<header.count ~= position)
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
        let newIndex = index - 1
        precondition(newIndex >= startIndex)
        return newIndex
    }
    
    @inlinable
    public func formIndex(before index: inout Int) {
        index -= 1
        precondition(startIndex..<endIndex ~= index)
    }
    
    @inlinable
    public func index(after index: Int) -> Int {
        let newIndex = index + 1
        precondition(newIndex <= endIndex)
        return newIndex
    }
    
    @inlinable
    public func formIndex(after index: inout Int) {
        precondition(startIndex..<endIndex ~= index)
        index += 1
    }
}
