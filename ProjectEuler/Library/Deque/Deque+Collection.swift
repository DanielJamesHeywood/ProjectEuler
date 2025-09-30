
extension Deque {
    
    @inlinable
    public var startIndex: Int { 0 }
    
    @inlinable
    public var endIndex: Int { count }
    
    @inlinable
    public var count: Int { _storage.count }
}
