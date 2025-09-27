
extension Deque: RandomAccessCollection, MutableCollection, RangeReplaceableCollection {
    
    public typealias Index = Int
    
    @inlinable
    public subscript(position: Int) -> Element {
        get {
            return _buffer.withUnsafeMutablePointers { pointerToHeader, pointerToElements in
                let header = pointerToHeader.pointee
                precondition(0..<header.count ~= position)
                return pointerToElements[(header.offset + position) % header.capacity]
            }
        }
        set(newElement) {
            fatalError()
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
        var newIndex = index
        formIndex(before: &newIndex)
        return newIndex
    }
    
    @inlinable
    public func formIndex(before index: inout Int) {
        index -= 1
        precondition(startIndex..<endIndex ~= index)
    }
    
    @inlinable
    public func index(after index: Int) -> Int {
        var newIndex = index
        formIndex(after: &newIndex)
        return newIndex
    }
    
    @inlinable
    public func formIndex(after index: inout Int) {
        precondition(startIndex..<endIndex ~= index)
        index += 1
    }
    
    @inlinable
    public init() {
        self.init(minimumCapacity: 0)
    }
    
    @inlinable
    public mutating func replaceSubrange<C: Collection>(
        _ subrange: Range<Int>,
        with newElements: C
    ) where C.Element == Element {
        fatalError()
    }
}
