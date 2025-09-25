
extension Deque: ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Element
    
    @inlinable
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}
