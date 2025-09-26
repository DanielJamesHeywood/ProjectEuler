
extension Deque: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, unlabeledChildren: self, displayStyle: .collection) }
}
