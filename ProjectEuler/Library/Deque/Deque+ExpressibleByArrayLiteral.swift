
extension Deque: ExpressibleByArrayLiteral {
    
    @inlinable
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}
