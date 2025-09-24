
extension Deque: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror {
        return Mirror(self, unlabeledChildren: self, displayStyle: .collection)
    }
}
